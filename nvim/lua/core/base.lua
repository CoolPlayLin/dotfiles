local opt = vim.opt

vim.scriptencoding = 'utf-8'

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.backup = false
opt.title = true
opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.ai = true
opt.si = true
opt.path:append { '**' }
opt.wildignore:append { '*/node_modules/*' }

-- basic highlighting
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
