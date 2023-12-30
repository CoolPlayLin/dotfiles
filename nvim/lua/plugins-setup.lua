local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]
)

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons"}
        }
        use {
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons" -- optional
            }
        }
        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "nvimdev/lspsaga.nvim",
            "christoomey/vim-tmux-navigator",
            "TimUntersberger/neogit",
            "navarasu/onedark.nvim",
            "rcarriga/nvim-notify",
            "akinsho/toggleterm.nvim",
            "j-hui/fidget.nvim"
          }
        use {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-path"
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require("nvim-treesitter.install").update({with_sync = true})
                ts_update()
            end
        }
        use {
            "numToStr/Comment.nvim",
            "windwp/nvim-autopairs",
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
            "akinsho/bufferline.nvim",
            "lewis6991/gitsigns.nvim",
            "onsails/lspkind.nvim"
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" }
        }
        use {
            "sbdchd/neoformat",
            config = function()
              vim.cmd([[
                augroup NeoformatAutogroup
                  autocmd!
                  autocmd BufWritePre * undojoin | Neoformat
                augroup END
              ]])
            end
        }
        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
            }
        use {
            "folke/trouble.nvim",
            requires = { "nvim-tree/nvim-web-devicons" },
        }
        use {
            'nvimdev/dashboard-nvim',
            event = 'VimEnter',
            requires = { "nvim-tree/nvim-web-devicons" }
        }
        use {
          "nvim-treesitter/nvim-treesitter-context", --show code context
          "gbprod/yanky.nvim",
          "norcalli/nvim-colorizer.lua",
          "folke/which-key.nvim",
          "folke/zen-mode.nvim",
          "karb94/neoscroll.nvim",
          "sindrets/diffview.nvim"
        }

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
