local luasnip_status_status, luasnip = pcall(require, "luasnip")
local lspkind_status, lspkind = pcall(require, "lspkind")
local cmp_status_status, cmp = pcall(require, "cmp")
local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

if not (autopairs_status or autotag_status or cmp_status_status or lspkind_status or luasnip_status_status) then
    return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {map_char = {tex = ""}})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup(
    {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}),
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            fallback()
                        else
                            fallback()
                        end
                    end,
                    {
                        "i",
                        "s"
                    }
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                    {
                        "i",
                        "s"
                    }
                )
            }
        ),
        sources = cmp.config.sources(
            {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" }
            }
        ),
        formatting = {
            format = lspkind.cmp_format(
                {
                    maxwidth = 50,
                    ellipsis_char = "..."
                }
            )
        }
    }
)

autopairs.setup ({
    check_ts = true,
    ts_config = {
        lua = {"string", "source"},
        javascript = {"string", "template_string"}
    },
    fast_wrap = {
        map = "<M-e>",
        chars = {"{", "[", "(", '"', "'"},
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment"
    },
    disable_filetype = {
      "powershell",
      "vim",
      "TelescopePrompt"
    }
})

autotag.setup()
