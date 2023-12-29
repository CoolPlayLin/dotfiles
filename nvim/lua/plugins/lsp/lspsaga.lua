local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status then
    return
end

local keymap = vim.keymap
local opts = {noremap = true, silent = true}

keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
keymap.set("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opts)
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
keymap.set("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", opts)

lspsaga.setup(
    {
        move_in_saga = {prev = "<C-k>", next = "<C-j>"},
        finder_action_keys = {
            open = "<CR>"
        },
        definition_action_keys = {
            edit = "CR"
        }
    }
)

