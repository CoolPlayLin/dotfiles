local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    return
end

local keymap = vim.keymap
local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- require ripgrep
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
