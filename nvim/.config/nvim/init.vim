" To update currently open vim, with updated config 
command Nvupd execute "source $MYVIMRC"

" User.*
lua << EOF
require('user.options')
EOF

lua << EOF
require('user.keymaps')
EOF

lua << EOF
require('user.colorscheme')
EOF

lua << EOF
require('user.plugins')
EOF

" telescope
lua << END
require('user.telescope')
END

" vim-gitgugger-config
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1

" LSP
" lsp-ruby
lua require('lspconfig').solargraph.setup{}

" lsp-ts
" lua require('lspconfig').denols.setup{}

" eslint
lua require('lspconfig').eslint.setup{}


" neoscroll
lua require('neoscroll').setup()

" colorizer-config
lua require'colorizer'.setup()

" autopairs-config
lua require('nvim-autopairs').setup()


" lua require('vim-gitgutter').setup()

" lualine-config
lua << END
require('lualine').setup() 
END

" lua-icons-config
lua require('nvim-web-devicons').setup()

" lua bufferline-config
lua << END
require('bufferline').setup {
  options = {
    numbers = 'ordinal'
  }
}
END

" auto-completion
set completeopt=menu,menuone,noselect

 lua <<EOF
   -- Setup nvim-cmp.
   local cmp = require'cmp'

   cmp.setup({
     snippet = {
       -- REQUIRED - you must specify a snippet engine
       expand = function(args)
         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
       end,
     },
     window = {
       -- completion = cmp.config.window.bordered(),
       -- documentation = cmp.config.window.bordered(),
     },
     mapping = cmp.mapping.preset.insert({
       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
       ['<C-f>'] = cmp.mapping.scroll_docs(4),
       ['<C-Space>'] = cmp.mapping.complete(),
       ['<C-e>'] = cmp.mapping.abort(),
       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
     }),
     sources = cmp.config.sources({
       { name = 'nvim_lsp' },
       { name = 'vsnip' }, -- For vsnip users.
       -- { name = 'luasnip' }, -- For luasnip users.
       -- { name = 'ultisnips' }, -- For ultisnips users.
       -- { name = 'snippy' }, -- For snippy users.
     }, {
       { name = 'buffer' },
     })
   })

   -- Set configuration for specific filetype.
   cmp.setup.filetype('gitcommit', {
     sources = cmp.config.sources({
       { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
     }, {
       { name = 'buffer' },
     })
   })

   -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline('/', {
     mapping = cmp.mapping.preset.cmdline(),
     sources = {
       { name = 'buffer' }
     }
   })

   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline(':', {
     mapping = cmp.mapping.preset.cmdline(),
     sources = cmp.config.sources({
       { name = 'path' }
     }, {
       { name = 'cmdline' }
     })
   })

-- Setup lspconfig.
--  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--  }
EOF

" -----------------------------------------------
" #configs |>                                 END
" -----------------------------------------------


" NVIM_TREE_START
" nvim-tree plugin config
lua << END
require('nvim-tree').setup {
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  view = {
    width = 35,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        },
      },
    },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
        },
      },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      },
    },
  hijack_directories = {
    enable = true,
    auto_open = true,
    },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
    },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
    },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
      },
    },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
    },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
    },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
      },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  trash = {
    cmd = "trash",
    require_confirm = true,
    },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
    },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      },
    },
  }
END


" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
 nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
" NVIM_TREE_END



" -----------------------------------------------
" RANDOM MISC useful snippets from the internet
" -----------------------------------------------
" makes terminal opened in insert mode
autocmd TermOpen * startinsert

" Adds synchronisation between NvimTree and opened file,
" basically, openes the current file's folder
autocmd BufEnter * lcd %:p:h

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" NOTE: not sure this works
" This should make autosave buffer on switch
" and autoread them on focus
au FocusLost,WinLeave * :silent! w

