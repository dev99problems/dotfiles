local telescope = require("telescope")
local actions = require("telescope.actions")

print('Ola from user.telescope config ')

telescope.setup({
  defaults = {
    -- mappings = {
    --   i = {
    --     ["<C-s>"] = actions.cycle_previewers_next,
    --     ["<C-a>"] = actions.cycle_previewers_prev,
    --   },
    -- },
  }
})

-- require('telescope').setup({
--   defaults = {
--     layout_config = {
--       vertical = { width = 0.2 }
--       -- other layout configuration here
--     },
--     -- other defaults configuration here
--   },
--   -- pickers = {
--   --   find_files = {
--   --     theme = "dropdown",
--   --   }
--   -- },
--   -- other configuration values here
-- })

