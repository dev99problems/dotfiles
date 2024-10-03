" User.*
lua require('user.options')

lua require('user.theme')

lua require('user.plugins')

lua require('user.keymaps')

" Plugins custom configs
lua require('user.plugins_configs')

lua require('user.cmp')

lua require('user.lsp')


" -----------------------------------------------
" RANDOM MISC useful snippets from the internet
" -----------------------------------------------
" makes terminal opened in insert mode
autocmd TermOpen * startinsert

" Neoformat config
let g:neoformat_try_node_exe = 1
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.ts,*.tsx Neoformat

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

" # pseudo-code to enable winbar only for reg buffers and avoid for nvim-tree, terminal, etc.
" au VimEnter,BufWinEnter * if &buftype == ““ | setlocal winbar=%f | endif

" keeps "virtual scroll" on buffer switch
autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=250
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction
