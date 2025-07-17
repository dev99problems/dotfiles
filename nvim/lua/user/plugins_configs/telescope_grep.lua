-- Existing multigrep setup with modifications
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end
      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end
      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end
      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten({
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      })
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "Multi Grep",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
      -- Add default_text support
      default_text = opts.default_text or "",
    })
    :find()
end

local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  if #lines == 0 then return "" end

  -- Handle single line selection
  if #lines == 1 then
    return string.sub(lines[1], start_pos[3], end_pos[3])
  end

  -- Handle multi-line selection (take first line for search)
  return string.sub(lines[1], start_pos[3])
end

local function grep_word_or_selection()
  local mode = vim.fn.mode()
  local search_text

  if mode == 'v' or mode == 'V' then
    search_text = get_visual_selection()
  else
    search_text = vim.fn.expand("<cword>")
  end

  if search_text and search_text ~= "" then
    require('telescope.builtin').live_grep({
      default_text = search_text,
    })
  end
end

M.setup = function()
  vim.keymap.set("n", "<leader>fw", grep_word_or_selection, { desc = "Multi Grep word under cursor" })
  vim.keymap.set("v", "<leader>fw", grep_word_or_selection, { desc = "Multi Grep selected text" })

  -- Alternative: Modifying existing <leader>fg to use word under cursor when no prompt
  vim.keymap.set("n", "<leader>fg", function()
    local word = vim.fn.expand("<cword>")
    live_multigrep({ default_text = word })
  end, { desc = "Multi Grep with word under cursor" })
end

M.setup()

-- Exposing method for external use
M.live_multigrep = live_multigrep

return M
