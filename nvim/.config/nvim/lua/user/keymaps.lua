local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap


-- Global --
-- add empty line in normal mode
keymap("", "<Enter>", "o<ESC>", opts)
keymap("", "<A-CR>", "O<ESC>", opts)

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--|||||----------------------------|||||--


-- # Normal --
-- better window navigation
keymap("n", "<C-H>", "<C-W>h", opts)
keymap("n", "<C-J>", "<C-W>j", opts)
keymap("n", "<C-K>", "<C-W>k", opts)
keymap("n", "<C-L>", "<C-W>l", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext <CR>", opts)
keymap("n", "<S-h>", ":bprevious <CR>", opts)

-- resize with arrows
keymap("n", "<S-Up>", ":resize +4<CR>", opts)
keymap("n", "<S-Down>", ":resize -4<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

 -- open a terminal
keymap("n", "<leader>t", ":terminal <CR>", opts)

 -- close buffers
keymap("n", "<leader>bd", ":bd <CR>", opts)

 -- close windows
keymap("n", "<leader>wd", ":bd <CR>", opts)

-- show registers
keymap("n", "<leader><leader>r", ":reg <CR>", opts)
--|||||----------------------------|||||--


-- # Insert --
-- fast way out
keymap("i", "jj", "<ESC>", opts)
--|||||----------------------------|||||--


-- # Visual --
-- unbind s in Visual mode to be able
-- to use vim-arround in Visual mode
keymap("v", "s", "<Nop>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- greatest remap ever
keymap("v", "p", '"_dP', opts)
--|||||----------------------------|||||--


-- # Visual Block --
-- " greatest remap ever, according to ThePrimeagen ;-)
keymap("x", "<leader><leader>p", "\"_dP", opts)
--|||||----------------------------|||||--

-- # Tools --
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- # Plugins --
-- ## Telescope --
-- find files using Telescope command-line sugar.
keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags <CR>", opts)

-- ## Bufferline
-- helps choose buffers by letter mnemonicks
keymap("n", "<leader>bb", ":BufferLinePick <CR>", opts)

-- switching between buffers
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1 <CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2 <CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3 <CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4 <CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5 <CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6 <CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7 <CR>", opts)

-- ## Nvim-tree
-- basic toggle of project-tree
keymap("n", "<C-n>", ":NvimTreeToggle <CR>", opts)







