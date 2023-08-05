local neoclip = require('neoclip')

neoclip.setup({
  enable_persistent_history = true,
  -- to make persistent history work, you need sqlite.lua plugin
  db_path = vim.fn.stdpath('data') .. '/databases/neoclip.sqlite3',
  keys = {
    telescope = {
      i = {
        select = '<c-p>',
        paste = '<cr>',
        paste_behind = '<c-b>', -- for some reason this — doesn't work
        delete = '<c-d>',  -- delete an entry
      }
    },
  }
})
