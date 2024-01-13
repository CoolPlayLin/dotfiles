local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
    return
end

bufferline.setup ({
    options = {
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
})
