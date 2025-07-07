return {
  {
    -- 2. CONFORM: USE RUFF FOR FORMATTING
    -- We'll update our conform.nvim config to use ruff for Python files.
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- THIS IS THE CHANGE: ruff now handles formatting.
        python = { "ruff_format" },
        c = { "clang_format" },
        cpp = { "clang_format" },

        -- Other formatters remain the same
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        -- ... etc
      },
    },
  },
  {
    -- 3. NVIM-LINT: USE RUFF FOR LINTING
    -- This plugin is included in NvChad and handles showing errors and warnings.
    -- We'll configure it to use ruff for Python files.
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
        c = { "gcc" },
        cpp = { "g++" },
      },
    },
  },
}
