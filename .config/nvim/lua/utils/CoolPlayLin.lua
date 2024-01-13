local utils = {}

function utils.greet()
  local current_user = vim.env.USER or vim.env.USERNAME or "陌生人"
  local current_time = tonumber(os.date("%H"))
  local function send(msg, user)
    pcall(vim.notify, msg, "info", { title = "亲爱的 "..user, timeout = 300 })
  end
  local packer_status, _ = pcall(require, "packer")

  if not packer_status then
    send("欢迎来到 CoolPlayLin 的 Neovim", current_user)
  elseif current_time < 4 then
    send("现在是凌晨了，要早点休息哦~", current_user)
  elseif current_time < 9 then
    send("早上好，又是元气满满的一天呀~", current_user)
  elseif current_time < 12 then
    send("已经中午了，快点去吃午餐呀~", current_user)
  else if current_time < 16 then
    send("下午好，记得多喝水哦~", current_user)
  elseif current_time < 18 then
    send("天快黑了，休息一下吧~", current_user)
  elseif current_time < 22 then
    send("晚上好，编码也要注意身体哦~", current_user)
  elseif current_time < 0 then
    send("夜深了，早点睡觉吧，晚安~", current_user)
  end
  end
end

function utils.cowboy()
	---@type table?
	local notify_id
	local notify_status = true

	for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
		local count = 0
		local timer = assert(vim.loop.new_timer())
		local map = key
		vim.keymap.set("n", key, function()
			if vim.v.count > 0 then
				count = 0
			end
			if count >= 10 then
				notify_status, notify_id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
					icon = "🤠",
					replace = notify_id,
					keep = function()
						return count >= 10
					end,
				})
				if not notify_status then
					notify_id = nil
					return map
				end
			else
				count = count + 1
				timer:start(2000, 0, function()
					count = 0
				end)
				return map
			end
		end, { expr = true, silent = true })
	end
end

return utils
