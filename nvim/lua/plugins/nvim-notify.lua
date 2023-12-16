local notify_status, notify = pcall(require, "notify")
if not notify_status then
    return
end

-- Setup nvim-notify as default notify of nvim
vim.notify = notify
