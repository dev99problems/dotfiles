syntax on
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" blocks ui cursor
" set guicursor=
set relativenumber  " enables relative line numbers
set nu              " stands for showing real line number for the current line
" set nohlsearch      " disables the search highlightning after exit from search mode
set hidden
set noerrorbells
" set incsearch
set scrolloff=6
set signcolumn=yes
set updatetime=100
" this makes buffer autoread on focus
" and any move event trigger
set autoread
au CursorHold * checktime  
set termguicolors " this variable must be enabled for colors to be applied properly

" -----------------------------------------------
" #plugins
" -----------------------------------------------


call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" https://github.com/windwp/nvim-autopairs
Plug 'windwp/nvim-autopairs'
Plug 'airblade/vim-gitgutter'
" Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Power lines
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" File Trees
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'preservim/nerdtree'

call plug#end()

" -----------------------------------------------
" #plugins                                    END
" -----------------------------------------------



" Color Scheme
" colorscheme gruvbox
" colorscheme palenight
set background=dark
colorscheme dracula


" -----------------------------------------------
" #keymaps
" -----------------------------------------------

" default VIM keymaps
let mapleader = " "
imap jj <Esc>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" unbind s in Visual mode to be able
" to use vim-arround in Visula mode
vmap s <Nop>


" add empty line in normal mode
map <Enter> o<ESC>
map <A-CR> O<ESC>

" keys for resizing window
" !!!!!!!!!!! NOT SURE ABOUT THIS !!!!!!!!!!!!!!!!!!!
nnoremap <silent><leader>+ :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><leader>- :exe "resize " . (winwidth(0) * 2/3)<CR>

" open a terminal
nnoremap <silent><leader><leader>t :exe "term"<CR>

" Closing buffers
nnoremap <silent><leader>bd :exe "bd"<CR>
" nnoremap <silent><leader>wd :exe "bw"<CR>

" changing size on +/-
nnoremap + :exe "vertical resize +7"<CR>
nnoremap _ :exe "vertical resize -7"<CR>


" ##telescope keys
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" ##bufferline keys
" nnoremap <silent>[b :BufferLineCycleNext<CR>
" nnoremap <silent>b] :BufferLineCyclePrev<CR>
nnoremap <silent><leader>bb :BufferLinePick<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" -----------------------------------------------
" #commands
" -----------------------------------------------
"  NOTE: @gene, this doesn't work correct
command Nvupd execute "source $MYVIMRC"


" ##nerdtree keys
" nnoremap <C-n> :NERDTreeToggle<CR>


" -----------------------------------------------
" #configs
" -----------------------------------------------

" vim-gitgugger-config
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1

" lsp-config
lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

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


" -----------------------------------------------
" !!!!!!!!!!! NOT SURE ABOUT THIS !!!!!!!!!!!!!!!!!!!
" NVIM_TREE is not used atm and replaced with NerdTree
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
  height = 30,
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


nnoremap <C-n> :NvimTreeToggle<CR>
"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
"let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
"let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
"let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
"let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
"let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
"let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
"let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
"let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
"let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
"    \ 'git': 1,
"    \ 'folders': 1,
"    \ 'files': 1,
"    \ 'folder_arrows': 1,
"    \ }
""If 0, do not show the icons for one of 'git' 'folder' and 'files'
""1 by default, notice that if 'files' is 1, it will only display
""if nvim-web-devicons is installed and on your runtimepath.
""if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
""but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

"let g:nvim_tree_view_side = 'left'
"let g:nvim_tree_trash_cmd = 'trash'
"let g:nvim_tree_trash_require_confirm = 1 

"" default will show icon by default if no icon is provided
"" default shows no icon by default
"let g:nvim_tree_icons = {
"    \ 'default': "",
"    \ 'symlink': "",
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★",
"    \   'deleted': "",
"    \   'ignored': "◌"
"    \   },
"    \ 'folder': {
"    \   'arrow_open': "",
"    \   'arrow_closed': "",
"    \   'default': "",
"    \   'open': "",
"    \   'empty': "",
"    \   'empty_open': "",
"    \   'symlink': "",
"    \   'symlink_open': "",
"    \   }
"    \ }

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


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Adds synchronisatin between NerdTree and opened file,
" basically, openes the current file's folder
autocmd BufEnter * lcd %:p:h

" NOT SURE this works
" This should make autosave buffer on switch
" and autoread them on focus
au FocusLost,WinLeave * :silent! w


" NerdTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
