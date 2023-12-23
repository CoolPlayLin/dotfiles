local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local keymap = vim.keymap
local on_attach = function(client, bufnr)
    local opts = {noremap = true, silent = true, buffer = bufnr}
    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

    -- typescript specific keymaps (e.g. rename file and update imports)
    if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
    end
end
lspconfig.pyright.setup(
    {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "strict",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true
                }
            }
        }
    }
)

lspconfig.yamlls.setup({})
lspconfig.jsonls.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup(
    {
        capabilities = capabilities
    }
)
--Enable (broadcasting) snippet capability for completion
lspconfig.html.setup(
    {
        capabilities = capabilities
    }
)
lspconfig.eslint.setup(
    {
        --- ...
        on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd(
                "BufWritePre",
                {
                    buffer = bufnr,
                    command = "EslintFixAll"
                }
            )
        end
    }
)
-- lua
lspconfig.lua_ls.setup(
    {
        on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                client.config.settings =
                    vim.tbl_deep_extend(
                    "force",
                    client.config.settings.Lua,
                    {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT"
                        },
                        diagnostics = {
                          globals = { 'vim' }
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            library = {vim.env.VIMRUNTIME}
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                )

                client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
            end
            return true
        end
    }
)

lspconfig.vuels.setup {
    filetypes = {"typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json"}
}

lspconfig.denols.setup {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = false
}

lspconfig.powershell_es.setup {
    bundle_path = vim.env.PowerShellEditorServices,
    shell = "pwsh.exe"
}

lspconfig.tailwindcss.setup({})
