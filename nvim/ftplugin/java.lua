local markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', 'build.gradle.kts', 'settings.gradle', 'settings.gradle.kts' }
local file_path = vim.api.nvim_buf_get_name(0)
local root_dir = vim.fs.root(0, markers) or vim.fs.dirname(file_path)

if not root_dir then
  vim.notify('JDTLS was not started: the current buffer has no file path.', vim.log.levels.WARN)
  return
end

local jdtls_cmd = vim.fn.exepath('jdtls')
if jdtls_cmd == '' then
  vim.notify('JDTLS was not started: install jdtls and make it available on PATH.', vim.log.levels.WARN)
  return
end

local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspaces/' .. vim.fn.sha256(root_dir)
vim.fn.mkdir(workspace_dir, 'p')

local handlers = require('user.lsp.handlers')
local config = {
  cmd = { jdtls_cmd, '-data', workspace_dir },
  root_dir = root_dir,
  capabilities = handlers.capabilities,
  on_attach = function(client, bufnr)
    handlers.on_attach(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', '<leader>oi', require('jdtls').organize_imports, opts)
  end,
  init_options = { bundles = {} },
  settings = { java = {} },
}

require('jdtls').start_or_attach(config)
