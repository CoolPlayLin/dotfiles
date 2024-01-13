local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
local nvim_web_devicons_status, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not (nvim_tree_status or nvim_web_devicons_status) then
    return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


nvim_web_devicons.setup ({
    default = true
})

-- empty setup using defaults
nvim_tree.setup()
