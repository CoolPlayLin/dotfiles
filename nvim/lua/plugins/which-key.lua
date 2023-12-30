local which_key_status, which_key = pcall(require, "which-key")
if not which_key_status then
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

which_key.setup({})
