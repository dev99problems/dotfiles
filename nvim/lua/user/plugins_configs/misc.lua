local utils = require('user.utils')

-- colorizer-config
utils.safe_require('colorizer').setup()

-- autopairs-config
utils.safe_require('nvim-autopairs').setup()

-- Q: Is this at all needed to be setuped?
-- require('vim-gitgutter').setup()

-- lua-icons-config
utils.safe_require('nvim-web-devicons').setup()

-- impatient-vim
utils.safe_require('impatient')

