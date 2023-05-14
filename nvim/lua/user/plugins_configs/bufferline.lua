local utils = require('user.utils')
local bufferline = utils.safe_require('bufferline')

-- NOTE: please do the bufferline switching work in order,
-- no matter if they were sorted to moved!!!

local get_current_dir = function ()
  -- NOTE: maybe you should pick only 
  -- the last section of path
  -- return vim.fn.getcwd()
  return 'Project Tree'
end

-- :h bufferline-configuration
-- OR https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
bufferline.setup {
  options = {
    mode = 'buffers', -- 'tabs' | 'buffers'
    numbers = 'ordinal',
    name_formatter = function()
      -- name                | str        | the basename of the active file
      -- path                | str        | the full path of the active file
      -- bufnr (buffer only) | int        | the number of the active buffer
      -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
      -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    end,
    -- max_name_length = 18,
    -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    -- tab_size = 21,
    diagnostics = 'nvim_lsp',
    -- prevents drawing tabs above Nvim_Tree
    offsets = {
      {
        filetype = 'NvimTree',
        text = get_current_dir(),
        text_align = 'center',
        separator = true
      }
    },
    -- color_icons = true | false, -- whether or not to add the filetype icon highlights
    -- show_buffer_icons = true | false, -- disable filetype icons for buffers
    -- show_buffer_close_icons = true | false,
    -- show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
    -- show_close_icon = true | false,
    -- show_tab_indicators = true | false,
    -- show_duplicate_prefix = true | false, -- whether to show duplicate buffer prefix
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = 'slant',
    -- enforce_regular_tabs = false | true,
    -- always_show_bufferline = true | false,
    always_show_bufferline = true
  }
}

