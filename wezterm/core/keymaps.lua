local wezterm = require("wezterm")

local action = wezterm.action
local utils = require("core.utils")
local keymaps_config = {}

keymaps_config.mod = wezterm.target_triple:find("windows") and "SHIFT|CTRL" or "SHIFT|SUPER"
keymaps_config.smart_split = wezterm.action_callback(function (window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(action.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
  else
    window:perform_action(action.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
  end
end)

function keymaps_config.setup(config)
  config.disable_default_key_bindings = true
  config.keys = {
    -- Scrollback
    { mods = keymaps_config.mod, key = "k", action = action.ScrollByPage(-0.5) },
    { mods = keymaps_config.mod, key = "j", action = action.ScrollByPage(0.5) },
    -- Create a new tab
    { mods = keymaps_config.mod, key = "t", action = action.SpawnTab("CurrentPaneDomain") },
    -- Move Tabs
    { mods = keymaps_config.mod, key = ">", action = action.MoveTabRelative(1) },
    { mods = keymaps_config.mod, key = "<", action = action.MoveTabRelative(-1) },
    -- Acivate Tabs
    { mods = keymaps_config.mod, key = "l", action = action({ ActivateTabRelative = 1 }) },
    { mods = keymaps_config.mod, key = "h", action = action({ ActivateTabRelative = -1 }) },
    { mods = keymaps_config.mod, key = "R", action = wezterm.action.RotatePanes("Clockwise") },
    -- show the pane selection mode, but have it swap the active and selected panes
    { mods = keymaps_config.mod, key = "S", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
    -- clipboard
    { mods = keymaps_config.mod, key = "C", action = action.CopyTo("Clipboard") },
    { mods = keymaps_config.mod, key = "Space", action = action.QuickSelect },
    { mods = keymaps_config.mod, key = "X", action = action.ActivateCopyMode },
    { mods = keymaps_config.mod, key = "f", action = action.Search("CurrentSelectionOrEmptyString") },
    { mods = keymaps_config.mod, key = "V", action = action.PasteFrom("Clipboard") },
    { mods = keymaps_config.mod, key = "M", action = action.TogglePaneZoomState },
    { mods = keymaps_config.mod, key = "n", action = action.ToggleFullScreen },
    { mods = keymaps_config.mod, key = "p", action = action.ActivateCommandPalette },
    { mods = keymaps_config.mod, key = "d", action = action.ShowDebugOverlay },
    utils.split_nav("resize", "CTRL", "LeftArrow", "Right"),
    utils.split_nav("resize", "CTRL", "RightArrow", "Left"),
    utils.split_nav("resize", "CTRL", "UpArrow", "Up"),
    utils.split_nav("resize", "CTRL", "DownArrow", "Down"),
    utils.split_nav("move", "CTRL", "h", "Left"),
    utils.split_nav("move", "CTRL", "j", "Down"),
    utils.split_nav("move", "CTRL", "k", "Up"),
    utils.split_nav("move", "CTRL", "l", "Right"),
    -- close current tab
    { mods = keymaps_config.mod, key = "q", action = action.CloseCurrentTab { confirm = false } },
  }
end

return keymaps_config
