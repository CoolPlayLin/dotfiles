local wezterm = require("wezterm")

local links_config = {}

function links_config.setup(config)
  config.hyperlink_rules = {
    -- mark email as a link
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = "mailto:$0"
    },
  }
end

return links_config
