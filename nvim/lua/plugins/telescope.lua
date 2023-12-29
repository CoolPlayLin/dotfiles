local telescope_status, telescope = pcall(require, "telescope")
local trouble_status, trouble = pcall(require, "trouble")
if not (telescope_status or trouble_status) then
    return
end


local keymap = vim.keymap
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local trouble_telescope = require("trouble.providers.telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble_telescope.open_with_trouble },
      n = { ["<c-t>"] = trouble_telescope.open_with_trouble },
    }
  }
})
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- require ripgrep
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
