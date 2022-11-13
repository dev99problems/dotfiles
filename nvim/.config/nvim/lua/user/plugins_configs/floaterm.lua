local utils = require('user.utils')

utils.safe_require('vim-floaterm').setup()

vim.cmd "let g:floaterm_width=0.85"
vim.cmd "let g:floaterm_height=0.9"
vim.cmd "let g:floaterm_wintype='float'"
