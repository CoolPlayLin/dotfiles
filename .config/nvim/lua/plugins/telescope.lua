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
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
     undo = {
      use_delta = true,
      use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      side_by_side = false,
      diff_context_lines = vim.o.scrolloff,
      entry_format = "state #$ID, $STAT, $TIME",
      time_format = "",
      saved_only = false,
      mappings = {
        i = {
          ["<cr>"] = require("telescope-undo.actions").yank_additions,
          ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-cr>"] = require("telescope-undo.actions").restore,
          -- alternative defaults, for users whose terminals do questionable things with modified <cr>
          ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-r>"] = require("telescope-undo.actions").restore,
        },
        n = {
          ["y"] = require("telescope-undo.actions").yank_additions,
          ["Y"] = require("telescope-undo.actions").yank_deletions,
          ["u"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("undo")

keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- require ripgrep
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
keymap.set("n", "<leader>fu", telescope.extensions.undo.undo, {})
keymap.set("n", "<Tab><leader>", ":Telescope file_browser<CR>", { noremap = true })
