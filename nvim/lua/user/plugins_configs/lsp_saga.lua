local keymap = vim.keymap.set
local opts = { silent = true }

-- NOTE: consider moving all this to keymaps.lua
--
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap("n", "sf", "<cmd>Lspsaga finder<CR>", opts)

-- Code action
keymap({"n","v"}, "sca", "<cmd>Lspsaga code_action<CR>", opts)

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

-- Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
keymap("n", "gds", "<cmd>split | Lspsaga goto_definition<CR>", opts)

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "sgd", "<cmd>Lspsaga peek_definition<CR>", opts)

keymap("n", "sgt", "<cmd>Lspsaga peek_type_definition<CR>", opts)

-- Show line diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "]a", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",opts)

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
