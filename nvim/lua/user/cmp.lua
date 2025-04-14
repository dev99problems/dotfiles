local is_cmp_ok, cmp = pcall(require, 'cmp')
if not is_cmp_ok then
  print 'cmp was not loaded properly!'
  return
end

local is_luasnip_ok, luasnip = pcall(require, 'luasnip')
if not is_luasnip_ok then
  print 'luasnip was not loaded properly!'
  return
end

require('luasnip.loaders.from_vscode').lazy_load({ paths = '~/.config/nvim/lua/user/snippets' })
require('luasnip.loaders.from_vscode').lazy_load()
-- for which lang. and then which snippets
luasnip.filetype_extend('javascript', { 'html' })
luasnip.filetype_extend('javascriptreact', { 'html' })
luasnip.filetype_extend('typescript', { 'html' })
luasnip.filetype_extend('typescriptreact', { 'html' })
luasnip.filetype_extend('astro', { 'html', 'javascript' })

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

vim.api.nvim_set_hl(0, "CmpItemKindTabNine", {fg ="#6CC644"})

-- all the icons examples can be checked:
-- 1. https://www.nerdfonts.com/cheat-sheet
-- 2. https://microsoft.github.io/vscode-codicons/dist/codicon.html 
-- 3. https://pictogrammers.com/library/mdi/
local kind_icons = {
  Text = '',
  Method = '',
  Function = '󰊕',
  Constructor = '',
  Field = '',
  Parameter = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '󱌒',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '󰏘',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { 'i', 's' }
    ),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }
    ),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        -- copilot = '[copilot]',
        luasnip = '[snip]',
        nvim_lsp = '[lsp]',
        cmp_tabnine = '[tab9]',
        path = '[path]',
        buffer = '[buffer]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    -- { name = 'copilot' },
    {
      name = 'nvim_lsp',
      max_item_count = 8
    },
    {
      name = 'luasnip',
      max_item_count = 4
    },
    { name = 'cmp_tabnine',
      max_item_count = 3
    },
    { name = 'buffer',
      max_item_count = 5
    },
    { name = 'path' }, -- keyword_length = <num> can be set for min num. of chars
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
