local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap_for_fn = vim.keymap.set
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

-- resize with arrows
keymap("n", "<S-Up>", ":resize +4<CR>", opts)
keymap("n", "<S-Down>", ":resize -4<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- QuickFix List
local function qf_nav(direction)
  local qf = vim.fn.getqflist({ idx = 0, size = 0 })
  if qf.size == 0 then
    vim.notify("Quickfix list is empty", vim.log.levels.WARN)
    return
  end

  if direction == "next" then
    if qf.idx == qf.size then
      vim.cmd("cfirst") -- wrap to first
    else
      vim.cmd("cnext")
    end
  elseif direction == "prev" then
    if qf.idx == 1 then
      vim.cmd("clast") -- wrap to last
    else
      vim.cmd("cprev")
    end
  end
end

-- vim.keymap.set("n", "<C-k>", , { desc = "Prev Quickfix item (cycled)" })
keymap("n", "<leader>qo", ":copen<CR>", { desc = "Open Quickfix" })
keymap("n", "<leader>qc", ":cclose<CR>", { desc = "Close Quickfix" })
keymap_for_fn("n", "<C-j>", function() qf_nav("next") end, { desc = "Next Quickfix item (cycled)" })
keymap_for_fn("n", "<C-k>", function() qf_nav("prev") end, { desc = "Prev Quickfix item (cycled)" })


-- NOTE: this should be a custom command!!!
-- select block in js
-- keymap("n", "<leader>vp", ":vertical resize +2<CR>", opts)

-- # buffers
-- close buffers
keymap("n", "<leader>d", ":bd <CR>", opts)
-- focus prev. open buffer
keymap("n", "<C-p>", ":b# <CR>", opts)
-- open most recently closed buffer
keymap("n", "<C-o>", ":e # <CR>", opts)

-- close windows
keymap("n", "<leader>wd", ":bd <CR>", opts)

-- show registers
keymap("n", "<leader><leader>r", ":reg <CR>", opts)

-- undo highlighting
keymap("n", "<C-i>", ":nohlsearch <CR>", opts)

-- save file
keymap("n", "SS", ":w! <CR>", opts)
keymap("i", "SS", "<C-c>:w! <CR>", opts)

-- split and closing it
keymap("n", "<leader>vs", ":vsplit <CR>", opts)
keymap("n", "<leader>vc", ":close <CR>", opts)

-- paste yank into the eol
keymap("n", "!", "A <esc>p", opts)

-- n/N while search + zz
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- half-way up/down + zz
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- better line jump remapping
keymap("n", "0", "^", opts)
keymap("n", "$", "g_", opts)
keymap("n", "^", "0", opts)
keymap("n", "g_", "$", opts)

-- move text up and down
keymap("n", "˚", ":m .-2<CR>==", opts)
keymap("n", "∆", ":m .+1<CR>==", opts)
--|||||----------------------------|||||--


-- # Insert --
-- fast way out
keymap("i", "jj", "<C-c>", opts)
--|||||----------------------------|||||--


-- # Visual --
-- unbind s in Visual mode to be able
-- to use vim-arround in Visual mode
keymap("v", "s", "<Nop>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- better cursor handling after yanking a block
keymap("v", "y", "ygv<Esc>", opts)

-- better pasting without spoiling the yank history
keymap("v", "p", '"_dP', opts)
--|||||----------------------------|||||--


-- # Visual Block --
-- " greatest remap ever, according to ThePrimeagen ;-)
keymap("x", "<leader><leader>p", "\"_dP", opts)

--|||||----------------------------|||||--

-- # Tools --
-- Terminal --
-- Better terminal navigation
-- !!! instead of recommended
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- !!! I have these, which let's me switch to prev/next buf

-- NOTE: since I've started using floaterm, looks like
-- there is no need in next 2
-- keymap("t", "<S-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<S-l>", "<C-\\><C-N><C-w>l", term_opts)

-- # Plugins --
-- ## telescope --
-- find files using Telescope command-line sugar.
keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>fc", ":Telescope file_browser path=%:p:h <CR>", opts)
keymap("n", "<leader>fu", ":Telescope find_files hidden=true <CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags <CR>", opts)
keymap("n", "<leader>fb", ":lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
keymap("n", "<leader>fd", ":Telescope diagnostics <CR>", opts)
keymap("n", "<leader>bb", ":Telescope buffers <CR>", opts)
keymap("n", "<M-e>", ":Telescope oldfiles <CR>", opts)
keymap("n", "<M-f>", ":Telescope current_buffer_fuzzy_find <CR>", opts)
keymap("n", "gst", ":Telescope git_status <CR>", opts)
-- lsp
keymap("n", "<leader>lr", ":Telescope lsp_references <CR>", opts)
keymap("n", "<leader>ldf", ":Telescope lsp_definitions <CR>", opts)
keymap("n", "<leader>lds", ":Telescope lsp_document_symbols <CR>", opts)
keymap("n", "<leader>lws", ":Telescope lsp_workspace_symbols <CR>", opts)
-- registers
keymap("n", "<leader>rr", ":Telescope registers <CR>", opts)
-- yank history
keymap("n", "<leader>ne", ":Telescope neoclip <CR>", opts)
-- bookmarks
-- TODO: @gene: replace this with something more stable & persistent
keymap("n", "gma", ":Telescope quickfix <CR>", opts)
-- commands
-- keymap("n", "<leader>fch", ":Telescope commands_history <CR>", opts)

-- ## floaterm
keymap("n", "<M-y>", ":FloatermToggle <CR>", opts)
keymap("t", "<M-y>", "<C-\\><C-n>:FloatermToggle <CR>", opts)
-- keymap("n", "<M-t>", ":FloatermToggle <CR>", opts)
-- keymap("t", "<M-t>", "<C-\\><C-n>:FloatermToggle <CR>", opts)

-- ## Bufferline
-- switching between buffers
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1 <CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2 <CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3 <CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4 <CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5 <CR>", opts)

-- close all tabs right & left from current one
keymap("n", "<leader>blr", ":BufferLineCloseRight <CR>", opts)
keymap("n", "<leader>bll", ":BufferLineCloseLeft <CR>", opts)
keymap("n", "<leader>blo", ":BufferLineCloseOthers <CR>", opts)

-- move left & right through buffers
keymap("n", "<S-h>", ":BufferLineCyclePrev <CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext <CR>", opts)

-- move
keymap("n", "<h", ":BufferLineMovePrev <CR>", opts)
keymap("n", "<l", ":BufferLineMoveNext <CR>", opts)

-- pin
keymap("n", "<leader>bp", ":BufferLineTogglePin <CR>", opts)

-- pick
keymap("n", "<leader>bs", ":BufferLinePick <CR>", opts)

-- sort by dir
keymap("n", "<leader>bst", ":BufferLineSortByDirectory <CR>", opts)

-- ## nvim-tree
-- basic toggle of project-tree
keymap("n", "<C-n>", ":NvimTreeToggle <CR>", opts)
-- NOTE: this doesn't work 🙃
-- keymap("n", "<leader>ft", ":NvimTreeFindFile <CR>", opts)
-- keymap("n", "<>", ":NvimTreeRefresh <CR>", opts)
-- More available functions:
-- NvimTreeResize
-- NvimTreeCollapse

-- ## gitui
keymap("n", "gui", ":lua require('gitui').toggle()<CR>", opts)
keymap("t", "gui", "<C-\\><C-n>:lua require('gitui').toggle()<CR>", opts)

-- ## fzf
-- history of commands
keymap("n", "<C-f>p", ":History<CR>", opts)
keymap("n", "<C-f>c", ":History:<CR>", opts)
keymap("n", "<C-f>m", ":Marks<CR>", opts)
keymap("n", "<C-f>b", ":BCommits<CR>", opts)
keymap("n", "<C-f>k", ":Maps<CR>", opts)

-- ## startify
keymap("n", "<M-s>s", ":SSave! <CR>", opts)
keymap("n", "<M-l>l", ":SLoad!", opts)

-- ## minimap
keymap('n', 'mmo', ':lua MiniMap.open()<CR>', opts)
keymap('n', 'mmc', ':lua MiniMap.close()<CR>', opts)

-- lsp
keymap("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = true }) <CR>", opts)
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)

-- todo-comments
keymap("n", "<leader>tt", ":TodoTrouble<CR>", opts)
keymap("n", "<leader>tc", ":TodoTrouble close<CR>", opts)
keymap("n", "<leader>tto", ":TodoTelescope keywords=TODO<CR>", opts)
keymap("n", "<leader>ttn", ":TodoTelescope keywords=NOTE<CR>", opts)
keymap("n", "]t", ":lua require('todo-comments').jump_next()<CR>", opts)
keymap("n", "[t", ":lua require('todo-comments').jump_prev()<CR>", opts)

-- blame
keymap("n", "<leader>gb", ":BlameToggle window<CR>", opts)
