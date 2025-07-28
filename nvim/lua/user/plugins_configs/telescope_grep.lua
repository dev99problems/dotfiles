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
  -- Exit visual mode first to update the selection marks
  vim.cmd('normal! gv')

  -- Small delay to ensure marks are updated
  vim.schedule(function()
    -- Get the selected text properly
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- Only handle single line selections
    if start_pos[2] ~= end_pos[2] then
      print("Multi-line selection not supported")
      return
    end

    -- Get the line
    local line = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, start_pos[2], false)[1]

    if not line then
      print("No selection")
      return
    end

    -- Get exactly what's selected
    local selected_text = string.sub(line, start_pos[3], end_pos[3])

    print("DEBUG: selected text = '" .. selected_text .. "'")

    if selected_text and selected_text ~= "" then
      live_multigrep({
        default_text = selected_text
      })
    else
      print("No text selected")
    end
  end)
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
  vim.keymap.set("n", "<leader>fg", live_multigrep, { desc = "Live multigrep" })
end

M.setup()

-- Exposing method for external use
M.live_multigrep = live_multigrep

return M
