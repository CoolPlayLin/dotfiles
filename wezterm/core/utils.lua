local wezterm = require("wezterm")

local utils = {}

function utils.is_nvim(pane)
  return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim")
end

---@param resize_or_move "resize" | "move"
---@param mods string
---@param key string
---@param dir "Right" | "Left" | "Up" | "Down"
function utils.split_nav(resize_or_move, mods, key, dir)
  local event = "SplitNav_" .. resize_or_move .. "_" .. dir
  wezterm.on(event, function(win, pane)
    if utils.is_nvim(pane) then
      -- pass the keys through to vim/nvim
      win:perform_action({ SendKey = { key = key, mods = mods } }, pane)
    else
      if resize_or_move == "resize" then
        win:perform_action({ AdjustPaneSize = { dir, 3 } }, pane)
      else
        local panes = pane:tab():panes_with_info()
        local is_zoomed = false
        for _, p in ipairs(panes) do
          if p.is_zoomed then
            is_zoomed = true
          end
        end
        wezterm.log_info("is_zoomed: " .. tostring(is_zoomed))
        if is_zoomed then
          dir = dir == "Up" or dir == "Right" and "Next" or "Prev"
          wezterm.log_info("dir: " .. dir)
        end
        win:perform_action({ ActivatePaneDirection = dir }, pane)
        win:perform_action({ SetPaneZoomState = is_zoomed }, pane)
      end
    end
  end)
  return {
    key = key,
    mods = mods,
    action = wezterm.action.EmitEvent(event),
  }
end


function utils.title(tab, max_width, icons)
  local title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or tab.active_pane.title
  local process, other = title:match("^(%S+)%s*%-?%s*%s*(.*)$")

  if icons[process] then
    title = icons[process] .. " " .. (other or "")
  end

  title = wezterm.truncate_right(title, max_width - 3)
  return " " .. title .. " "
end

return utils
