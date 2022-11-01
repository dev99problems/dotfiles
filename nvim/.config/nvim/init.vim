" To update currently open vim, with updated config
command Nvupd execute "source $MYVIMRC"

" User.*
lua require('user.options')

lua require('user.keymaps')

lua require('user.theme')

lua require('user.plugins')

" Plugins custom configs
lua require('user.plugins_configs')

lua require('user.cmp')

lua require('user.lsp')


" vim-gitgugger-config
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1

" -----------------------------------------------
" RANDOM MISC useful snippets from the internet
" -----------------------------------------------
" makes terminal opened in insert mode
autocmd TermOpen * startinsert

" Adds synchronisation between NvimTree and opened file,
" basically, openes the current file's folder
" NOTE: this stuff worked cool but together with Telescope,
" and configured nvim-tree to highlight current file, this looks
" redundant and should be REMOVED in near future
" autocmd BufEnter * lcd %:p:h

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" NOTE: not sure this works
" This should make autosave buffer on switch
" and autoread them on focus
au FocusLost,WinLeave * :silent! w

