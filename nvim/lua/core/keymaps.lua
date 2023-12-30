vim.g.mapleader = " "
local keymap = vim.keymap

-- window
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- switch buffer
keymap.set("n", "<leader>l", ":bnext<CR>")
keymap.set("n", "<leader>h", ":bprevious<CR>")
