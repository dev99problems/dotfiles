local utils = require('user.utils')

-- NOTE: just in case you'll need these
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

utils.safe_require('indent_blankline').setup {
  show_current_context = true,
  -- show_current_context_start = true,
  -- show_end_of_line = true,
}
