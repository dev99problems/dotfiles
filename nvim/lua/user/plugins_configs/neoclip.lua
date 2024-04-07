local neoclip = require('neoclip')

local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end

neoclip.setup({
  enable_persistent_history = true,
  -- to make persistent history work, you need sqlite.lua plugin
  db_path = vim.fn.stdpath('data') .. '/databases/neoclip.sqlite3',
  filter = function(data)
    return not all(data.event.regcontents, is_whitespace)
  end,
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
