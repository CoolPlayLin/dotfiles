local gitsigns_status, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status then
    return
end

gitsigns.setup ({
    signs = {
        add = {text = "+"},
        change = {text = "~"},
        delete = {text = "_"},
        topdelete = {text = "‾"},
        changedelete = {text = "~"}
    },
    on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '`hs', gs.stage_hunk)
    map('n', '`hr', gs.reset_hunk)
    map('v', '`hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '`hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '`hS', gs.stage_buffer)
    map('n', '`hu', gs.undo_stage_hunk)
    map('n', '`hR', gs.reset_buffer)
    map('n', '`hp', gs.preview_hunk)
    map('n', '`hb', function() gs.blame_line{full=true} end)
    map('n', '`tb', gs.toggle_current_line_blame)
    map('n', '`hd', gs.diffthis)
    map('n', '`hD', function() gs.diffthis('~') end)
    map('n', '`td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
