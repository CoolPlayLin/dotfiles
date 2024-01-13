local zen_mode_status, zen_mode = pcall(require, "zen-mode")
if not zen_mode_status then
  return
end

zen_mode.setup({})
