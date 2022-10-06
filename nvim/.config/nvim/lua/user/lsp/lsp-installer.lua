local utils = require('user.utils')
local lsp_installer = utils.safe_require('nvim-lsp-installer')

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead.
local tbl_extend = vim.tbl_deep_extend

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require('user.lsp.handlers').on_attach,
		capabilities = require('user.lsp.handlers').capabilities,
	}

	 if server.name == 'jsonls' then
	 	local jsonls_opts = require('user.lsp.settings.jsonls')
	 	opts = tbl_extend('force', jsonls_opts, opts)
	 end

	 if server.name == 'sumneko_lua' then
	 	local sumneko_opts = require('user.lsp.settings.sumneko_lua')
	 	opts = tbl_extend('force', sumneko_opts, opts)
	 end

	 if server.name == 'pyright' then
	 	local pyright_opts = require('user.lsp.settings.pyright')
	 	opts = tbl_extend('force', pyright_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

