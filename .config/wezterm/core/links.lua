local wezterm = require("wezterm")

local links_config = {}

function links_config.setup(config)
  config.hyperlink_rules = {
    -- mark email as a link
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = "mailto:$0"
    },
    {
      regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
      format = "$0"
    },
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = "$0"
    },
     {
      regex = [[\bfile://\S*\b]],
      format = "$0",
    }
  }
end

return links_config
