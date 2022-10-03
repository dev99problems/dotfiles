" To update currently open vim, with updated config 
command Nvupd execute "source $MYVIMRC"

" User.*
lua require('user.options')

lua require('user.keymaps')

lua require('user.colorscheme')

lua require('user.plugins_list')

" Plugins custom configs
lua require('user.plugins.index')

lua require('user.cmp')


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


" auto-completion
set completeopt=menu,menuone,noselect


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

