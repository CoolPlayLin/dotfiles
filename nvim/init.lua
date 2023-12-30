-- Packer
require("plugins-setup")

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
require("plugins.neoformat")
require("plugins.neogit")
require("plugins.trouble")
require("plugins.dashboard")
require("plugins.context")
require("plugins.yanky")
-- language server
require("plugins.lsp.lspconfig")
require("plugins.lsp.lspsaga")
require("plugins.lsp.mason")
require("plugins.lsp.fidget")
