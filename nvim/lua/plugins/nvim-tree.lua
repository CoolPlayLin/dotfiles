local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
local nvim_web_devicons_status, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not nvim_tree_status then
    return
end
if not nvim_web_devicons_status then
    return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
nvim_tree.setup()

-- 配置 NvimTree 的图标设置
nvim_web_devicons.setup {
    default = true
}
