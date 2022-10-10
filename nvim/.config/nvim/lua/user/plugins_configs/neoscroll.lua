local utils = require('user.utils')

-- https://github.com/karb94/neoscroll.nvim
utils.safe_require('neoscroll').setup {
  -- perf_mode is not set by default
  performance_mode = true
}
