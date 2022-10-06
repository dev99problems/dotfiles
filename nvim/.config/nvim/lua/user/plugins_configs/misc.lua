local utils = require('user.utils')

-- neoscroll
utils.safe_require('neoscroll').setup()

-- colorizer-config
utils.safe_require('colorizer').setup()

-- autopairs-config
utils.safe_require('nvim-autopairs').setup()

-- require('vim-gitgutter').setup()

-- lualine-config
utils.safe_require('lualine').setup()

-- lua-icons-config
utils.safe_require('nvim-web-devicons').setup()
