local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "tokyonight_night"

-- The core config sets
require("core").setup(config)

return config
