local neoclip = require('neoclip')

neoclip.setup({
  enable_persistent_history = true,
  -- to make persistent history work, you need sqlite.lua plugin
  db_path = vim.fn.stdpath('data') .. '/databases/neoclip.sqlite3',
  keys = {
    telescope = {
      i = {
        select = '<cr>',
        -- paste = '<c-p>',
        paste_behind = '<c-i>',
        edit = '<c-e>', -- edit an entry
        delete = '<c-d>',  -- delete an entry
      }
    },
  }
})
