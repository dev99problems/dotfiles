local utils = require('user.utils')
utils.safe_require('lspconfig')

require('user.lsp.lsp-installer')
require('user.lsp.handlers').setup()
