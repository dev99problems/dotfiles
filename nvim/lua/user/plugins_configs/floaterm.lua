local utils = require('user.utils')

utils.safe_require('vim-floaterm').setup()

vim.cmd "let g:floaterm_width=0.95"
vim.cmd "let g:floaterm_height=0.95"
vim.cmd "let g:floaterm_wintype='float'"
