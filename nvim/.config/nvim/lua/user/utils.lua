local M = {}
local Mock = {
  setup = function (param) end
}

function M.safe_require(module_name, err_msg)
  err_msg = err_msg or ' can not be loaded'

  local status_ok, module = pcall(require, module_name)
  if not status_ok then
    vim.notify(module_name .. ' ' .. err_msg)
    return Mock
  end
  return module
end

function M.safe_call(cmd, param, err_msg)
  err_msg = err_msg or ' can not be set'

  local status_ok = pcall(cmd, param)
  if not status_ok then
    vim.notify(param .. ' ' .. err_msg)
    return
  end
end

return M
