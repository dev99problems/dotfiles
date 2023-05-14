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

local pyright_settings = require('user.lsp.settings.pyright').settings
lspconfig.pyright.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = pyright_settings
}

local jsonls_settings = require('user.lsp.settings.jsonls').settings
lspconfig.jsonls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = jsonls_settings
}

lspconfig.solargraph.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

lspconfig.marksman.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

lspconfig.tsserver.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

lspconfig.eslint.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

lspconfig.gopls.setup {}

lspconfig.cssls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}

lspconfig.bashls.setup {
  attach = opts.on_attach,
  capabilities = opts.capabilities,
}
