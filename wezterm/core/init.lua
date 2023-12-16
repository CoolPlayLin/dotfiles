local wezterm = require("wezterm")
local core_config = {}

function core_config.fonts(config)
  -- fonts
  config.font = wezterm.font_with_fallback {
    -- for more information
    -- https://github.com/microsoft/cascadia-code
    -- https://github.com/ryanoasis/nerd-fonts/tree/master/src/unpatched-fonts/CascadiaCode
    {
      family = "CaskaydiaCove NF",
      weight = "Bold"
    },
    -- for more information
    -- https://github.com/subframe7536/maple-font/
    {
      family = "Maple Mono SC NF",
      weight = "Bold"
    },
    {
      family = "Maple Mono NF",
      weight = "Bold"
    },
    -- non-NF fonts
    {
      family = "Cascadia Mono",
      weight = "Bold"
    },
    {
      family = "Cascadia Code",
      weight = "Bold"
    },
  }
end

function core_config.mouse(config)
  config.mouse_bindings = {
    -- Right click to paste from Clipboard
    {
      event = { Down = { streak = 1, button = "Right"} },
      mods = "NONE",
      action = wezterm.action.PasteFrom("Clipboard")
    }
  }
end

function core_config.setup(config)
  require("core.keymaps").setup(config)
  require("core.links").setup(config)
  require("core.system").setup(config)
  require("core.tabs").setup(config)
  core_config.fonts(config)
  core_config.mouse(config)
end

return core_config
