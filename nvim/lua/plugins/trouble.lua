local trouble_status, trouble = pcall(require, "trouble")
local keymap = vim.keymap
if not trouble_status then
  return
end

local handler = {}
function handler.quickfix()
  trouble.toggle("quickfix")
end
function handler.loclist()
  trouble.toggle("loclist")
end
function handler.lsp_references()
  trouble.toggle("lsp_references")
end
function handler.workspace_diagnostics()
   trouble.toggle("workspace_diagnostics")
end
function  handler.document_diagnostics()
   trouble.toggle("document_diagnostics")
end

keymap.set("n", "<Leader>xo", trouble.open)
keymap.set("n", "<Leader>xq", trouble.close)
keymap.set("n", "<Leader>xq", handler.quickfix)
keymap.set("n", "<Leader>xl", handler.loclist)
keymap.set("n", "<Leader>gr", handler.lsp_references)
keymap.set("n", "<leader>xw", handler.workspace_diagnostics)
keymap.set("n", "<leader>xd", handler.document_diagnostics)
