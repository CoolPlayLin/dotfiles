local onedark_status, onedark = pcall(require, "onedark")
if not onedark_status then
    return
end

onedark.setup {
    style = "deep",
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none"
    },
    lualine = {
        transparent = false -- lualine center bar transparency
    },
    colors = {}, -- Override default colors
    diagnostics = {
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true -- use background color for virtual text
    },
    highlights = {} -- Override highlight groups
}
onedark.load()
