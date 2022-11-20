local utils = require('user.utils')
local ufo = utils.safe_require('ufo')

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})

-- NOTE: if this set to e.g. 0, on opening file
-- all the scopes will be folded by default
vim.o.foldlevelstart = 99
