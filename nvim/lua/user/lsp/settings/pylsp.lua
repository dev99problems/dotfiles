return {
  settings = {
    cmd = { vim.fn.getcwd() .. "/.venv/bin/pylsp" },
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },  -- disable default style checker
        pylint = { enabled = true, executable = "pylint" },
        mccabe = { enabled = false },
        yapf = { enabled = false },
        autopep8 = { enabled = false },

        -- ✅ Enable black for formatting
        black = {
          enabled = true,
          line_length = 88,
        },

        -- ✅ Ruff (optional)
        ruff = {
          enabled = true,
        },

        -- ✅ Mypy (optional)
        mypy = {
          enabled = true,
          live_mode = true,
        },

        -- Optional: import sorting, docstring completion
        isort = { enabled = false },
        rope_completion = { enabled = true },
      },
    },
  },
}
