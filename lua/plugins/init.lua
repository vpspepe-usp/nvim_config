return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- ~/.config/nvim/lua/custom/plugins/init.lua
  -- This is where you add your custom plugins.
  -- Each plugin is defined as a table within this main 'return {}' table.
  -- NvChad's core plugins are typically loaded elsewhere, so you just add yours here.
  -- Example for ~/.config/nvim/lua/plugins/auto-session.lua
  -- {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup({
  --       auto_restore_last_session = false, -- THIS MUST BE FALSE
  --       auto_session_sync_cwd = true, -- Keep this true for normal operation
  --       bypass_netrw_error = true,
  --       enabled = true,
  --       log_level = 2,
  --       -- Also, double-check your vim.opt.sessionoptions in options.lua as well.
  --       -- It should have 'localoptions' appended.
  --     })
  --   end,
  --   -- ...
  -- },
  -- --- auto-session plugin ---
  --   {
  --   "richardhapb/pytest.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter", -- Dependency for pytest.nvim
  --   },
  --   -- The 'opts' table and 'config' function are together here.
  --   -- 'opts' is automatically passed to the 'config' function as the second argument.
  --   opts = {
  --     add_args = { "-vv" }, -- Example: add verbose output to pytest runs
  --     -- docker = { enabled = true, container = "my-dev-container" },
  --     -- django = { enabled = true, django_settings_module = "myproject.settings.test" },
  --   },
  --   config = function(_, opts) -- '_opts' captures the 'opts' table defined above
  --     require("pytest").setup(opts) -- Pass the captured 'opts' to the plugin's setup function
  --     -- Keybindings for pytest.nvim
  --     vim.keymap.set("n", "<leader>rt", "<CMD>Pytest<CR>", { desc = "Run Pytest (current file)" })
  --     vim.keymap.set("n", "<leader>rto", "<CMD>PytestOutput<CR>", { desc = "Show Pytest Output" })
  --   end,
  -- },
  --
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
