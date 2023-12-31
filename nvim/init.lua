-- loading basic config
require("core.base")
require("core.keymaps")

-- plugins
require("plugins.theme")
require("plugins.telescope")
require("plugins.nvim-notify")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.cmp")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.bufferline")
require("plugins.treesitter")
require("plugins.toggleterm")
require("plugins.neogit")
require("plugins.trouble")
require("plugins.dashboard")
require("plugins.context")
require("plugins.yanky")
require("plugins.colorizer")
require("plugins.zen-mode")
require("plugins.which-key")
require("plugins.neoscroll")
require("plugins.diffview")

-- language server
require("plugins.lsp.lspconfig")
require("plugins.lsp.lspsaga")
require("plugins.lsp.mason")
require("plugins.lsp.fidget")

-- custom plugins
require("core.CoolPlayLin")

-- Packer
require("plugins-setup")
