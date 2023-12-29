vim.cmd([[
  augroup NeoformatAutogroup
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]])
