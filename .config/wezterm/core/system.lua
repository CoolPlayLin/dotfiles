local wezterm = require("wezterm")
local os = require("os")
local system_config = {}

function system_config.windows(config)
  config.default_prog = { 'pwsh.exe' }
  config.launch_menu = {
    {
      label = "Powershell",
      args = { 'pwsh.exe', '-NoLogo' },
    },
    {
      label = "Windows Powershell",
      args = { "powershell.exe", "-NoLogo" }
    },
    {
      label = "Command Prompt",
      args = { table.concat({os.getenv("SystemRoot"), "\\System32\\cmd.exe"}) }
    }
  }
end


function system_config.setup(config)
  if wezterm.target_triple:find("windows") then
    system_config.windows(config)
  end
end

return system_config
