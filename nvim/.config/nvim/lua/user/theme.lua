local theme = 'dracula'
local theme_param = 'colorscheme ' .. theme

local status_ok, _ = pcall(vim.cmd, theme_param)

if not status_ok then
  vim.notify(theme_param .. ' not found')
  return
end

