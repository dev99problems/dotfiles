local utils = require('user.utils')

local theme = 'solarized'
-- local theme = 'dracula'
local theme_param = 'colorscheme ' .. theme
local err_msg = theme_param .. ' can not be found'

utils.safe_call(vim.cmd, theme_param, err_msg)
