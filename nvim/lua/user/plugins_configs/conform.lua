local ok, conform = pcall(require, 'conform')
if not ok then
  return
end

conform.setup {
  formatters = {
    project_google_java_format = {
      command = 'google-java-format',
      condition = function()
        return vim.fn.executable('google-java-format') == 1
      end,
      stdin = true,
    },
  },
  formatters_by_ft = {
    java = { 'project_google_java_format' },
  },
  format_on_save = function(bufnr)
    if vim.bo[bufnr].filetype == 'java' then
      return { timeout_ms = 3000, lsp_format = 'never' }
    end
  end,
}
