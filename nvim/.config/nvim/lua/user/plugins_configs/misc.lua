-- One-liners setup
local safe_require = function (module_name)
  local status_ok, module = pcall(require, module_name)
  if not status_ok then
    print(module_name .. ' module can not be loaded')
    return
  end
  
  return module
end

-- neoscroll
safe_require('neoscroll').setup()

-- colorizer-config
safe_require('colorizer').setup()

-- autopairs-config
safe_require('nvim-autopairs').setup()

-- require('vim-gitgutter').setup()

-- lualine-config
safe_require('lualine').setup() 

-- lua-icons-config
safe_require('nvim-web-devicons').setup()
