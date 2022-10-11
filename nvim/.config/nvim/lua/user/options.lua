local options = {
  syntax = 'on',
  mouse = 'a',
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,

  relativenumber = true,
  nu = true,
  scrolloff = 6,
  signcolumn = 'yes',
   -- this makes buffer autoread on focus
  autoread = true,
  -- NOTE: next 2 lines seems a bit broken
  -- au = CursorHold * checktime  
  termguicolors = true,
  background = 'dark',

  splitbelow = true,
  splitright = true,
  fileencoding = 'utf-8',
  undofile = true,
  updatetime = 100,
  cursorline = true,

  -- disables the search highlightning after exit from search mode
  hlsearch = false,
  -- incsearch = true,
}

vim.opt.shortmess:append 'c'
 -- auto-completion
vim.cmd 'set completeopt=menu,menuone,noselect'
vim.cmd 'set modifiable'

for k, v in pairs(options) do
  vim.opt[k] = v
end

