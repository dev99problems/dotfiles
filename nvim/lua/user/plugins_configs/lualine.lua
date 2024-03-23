local utils = require('user.utils')
local lualine = utils.safe_require('lualine')

lualine.setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filesize'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = true,
        path = 1,
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory

        shorting_target = 20,    -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]',     -- Text to show for new created file before first writting
        }
      },
    },
    lualine_x = {'location'},
    lualine_y = {'progress'},
    lualine_z = {'diff', 'diagnostics'}
  },
}
