local neoformat_status, neoformat = pcall(require, "neoformat")
if not neoformat_status then
  return
end

vim.cmd([[
  augroup NeoformatAutogroup
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]])
