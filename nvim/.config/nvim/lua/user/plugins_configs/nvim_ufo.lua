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

-- ## Basics
-- zd — delete one fold at the cursor
-- zD — delete all folds under cursor recursively
-- zE — eliminate all folds in the window
-- zo — open one fold

-- za — fond/unfold a paragraph under cursor
-- zA — fond/unfold a paragraph under cursor recursively 🤯

-- ## Advanced
-- Using `kevinhwang91/nvim-ufo` plugin for folding/unfolding there are 2 additional hotkeys:
-- zM - fold everything
-- zR - unfold everything

