local utils = require('user.utils')

utils.safe_require('material').setup({
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windowsmi
    cursor_line = true -- Enable darker background for the cursor line
  },
  plugins = {
    -- Available plugins:
    -- "dap",
    -- "dashboard",
    -- "gitsigns",
    -- "hop",
    -- "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    'nvim-cmp',
    -- "nvim-navic",
    'nvim-tree',
    -- "sneak",
    'telescope',
    'trouble',
    -- "which-key",
  },
  high_visibility = {
    lighter = true, -- Enable higher contrast text for darker style
    darker = true -- Enable higher contrast text for darker style
  },
})

