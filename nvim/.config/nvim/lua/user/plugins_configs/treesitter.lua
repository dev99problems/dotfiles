local utils = require('user.utils')
local configs = utils.safe_require('nvim-treesitter.configs')

configs.setup {
  ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css', 'json', 'ruby', 'python', 'go', 'sql' },
  -- ensure_installed = 'all',
  sync_install = false,
  ignore_install = { '' }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { 'yaml' } },
}
