local utils = require('user.utils')

-- local theme = 'solarized'
-- local theme = 'dracula'
local theme = 'material'
-- local theme = 'everforest'

local theme_param = 'colorscheme ' .. theme
local err_msg = theme_param .. ' can not be found'

if theme == 'material' then
  local material_theme

  -- material_theme = 'deep ocean'
  material_theme = 'palenight'
  -- material_theme = 'lighter'
  -- material_theme = 'darker'
  -- material_theme = 'oceanic'

  vim.g.material_style = material_theme
end

if theme == 'everforest' then
  vim.cmd 'set background=light'
  vim.cmd 'let g:everforest_better_performance=1'
  vim.cmd 'let g:everforest_background="soft"' -- hard | medium | soft
end

utils.safe_call(vim.cmd, theme_param, err_msg)
