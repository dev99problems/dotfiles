local utils = require('user.utils')
local bufferline = utils.safe_require('bufferline')

bufferline.setup {
  options = {
    numbers = 'ordinal'
  }
}
