local utils = require('user.utils')
local lsp_installer = utils.safe_require('nvim-lsp-installer')
local lspconfig = utils.safe_require('lspconfig')
local lsp_handlers = require('user.lsp.handlers')

lsp_installer.setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local opts = {
  on_attach = lsp_handlers.on_attach,
  capabilities = lsp_handlers.capabilities,
}

-- lua_ls config
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- python
local pyright_settings = require('user.lsp.settings.pyright').settings
lspconfig.pyright.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = pyright_settings
}

local pylsp_settings = require('user.lsp.settings.pylsp').settings
lspconfig.pylsp.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = pylsp_settings
}

-- json
local jsonls_settings = require('user.lsp.settings.jsonls').settings
lspconfig.jsonls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = jsonls_settings
}

-- ruby
lspconfig.solargraph.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

-- md
lspconfig.marksman.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

-- ts
lspconfig.ts_ls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

-- eslint
lspconfig.eslint.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

-- go
local gopls_settings = require('user.lsp.settings.gopls').settings
lspconfig.gopls.setup {
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = gopls_settings
}

-- css
lspconfig.cssls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

-- bash
lspconfig.bashls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}


local keymap = vim.keymap.set
local opts = { silent = true }

keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
