local yanky_status, yanky = pcall(require, "yanky")
if not yanky_status then
  return
end

local keymap = vim.keymap

yanky.setup({})

keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)")
keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")
