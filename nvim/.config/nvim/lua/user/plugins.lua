local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  print 'Packer can not be loaded!'
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- this one fixes issue with search_in_buf
    -- tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use({
    'glepnir/lspsaga.nvim',
    branch = 'main',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup({})
    end,
  })

  -- NOTE: tried to make this fly, but didn't succeed. For now
  -- use {
  --   'autozimu/LanguageClient-neovim',
  --   branch = 'next',
  --   run = 'bash install.sh'
  -- }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v1.1.0'
  }
  use 'rafamadriz/friendly-snippets'
  -- use 'MarcWeber/vim-addon-mw-utils'
  -- use 'tomtom/tlib_vim'
  -- use 'garbas/vim-snipmate'

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- fzf
  use { 'junegunn/fzf', run = ':call fzf#install()' }
  use { 'junegunn/fzf.vim' }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- power lines
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- file trees
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- terminal
  use 'voldikss/vim-floaterm'

  -- perf
  use 'lewis6991/impatient.nvim'

  -- Plug 'ThePrimeagen/vim-be-good'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- scroll
  use 'karb94/neoscroll.nvim'

  -- folding & Indentation
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- yank history
  use {
    'AckslD/nvim-neoclip.lua',
    requires = {
      { 'nvim-telescope/telescope.nvim' }
    }
  }

  -- trouble
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- themes
  use 'gruvbox-community/gruvbox'
  use {
    'dracula/vim',
    as = 'dracula'
  }
  use 'drewtempelmeyer/palenight.vim'
  use {
    'sonph/onehalf',
    rtp = 'vim'
  }
  use 'shaunsingh/solarized.nvim'
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/everforest'

  -- misc
  use 'lukas-reineke/indent-blankline.nvim' -- this one is so good!
  use 'mhinz/vim-startify'
  use 'ThePrimeagen/vim-be-good'
  use { 'echasnovski/mini.map', branch = 'stable' }
  use "sbdchd/neoformat"

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
