vim.cmd 'let g:startify_custom_indices = map(range(10, 99), "string(v:val)")'
-- vim.cmd 'let g:startify_session_autoload = 1' -- could not make it work atm
vim.cmd 'let g:startify_files_number = 7'
vim.cmd [[ let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
]]

