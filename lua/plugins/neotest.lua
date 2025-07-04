-- ~/.config/nvim/lua/plugins/neotest.lua

return {
  {
    "nvim-neotest/neotest",
    ft = "python",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "antoinemadec/FixCursorHold.nvim", -- Required for async updates
      -- Debugging integration
      "mfussenegger/nvim-dap", -- The DAP client
      -- "rcarriga/nvim-dap-ui", -- Optional: For a nicer debug UI
      -- "theHamsta/nvim-dap-virtual-text", -- Optional: Shows variables inline

      -- Optional: For UI components
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    config = function()
      local neotest = require "neotest"

      neotest.setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
            args = { "--maxfail=5", "--disable-warnings" },
            runner = "pytest",
            debugger = "debugpy",
          },
        },
        -- General Neotest options
        -- See :help neotest.config
        -- Output panel for test results
        output = {
          enabled = true,
          -- Options for the output window (e.g., 'bottom', 'right', 'float')
          open_on_run = true,
        },
        summary = {
          enabled = true,
          -- Options for the summary window
        },
        float = {
          -- Options for floating windows (if you use float output_mode)
          border = "rounded",
          max_width = 100,
          max_height = 25,
        },
      }
      -- Keybindings are usually set in lua/config/keymaps.lua
      -- but you can define them here if you prefer.
      -- Optional: Configure nvim-dap-ui if installed
      if package.loaded["nvim-dap-ui"] then
        require("nvim-dap-ui").setup {
          -- layout = {
          --   { elements = { "scopes", "breakpoints", "stacks", "watches" }, size = 0.25 },
          --   { elements = { "repl", "console" }, size = 0.75 },
          -- },
          -- controls = {
          --   element = "buttons",
          --   enabled = true,
          --   size = 1,
          -- },
        }
      end

      -- Optional: Configure nvim-dap-virtual-text
      if package.loaded["nvim-dap-virtual-text"] then
        require("nvim-dap-virtual-text").setup()
      end

      -- Setup DAP for Python with debugpy (this is usually handled by mason-nvim-dap's handler)
      -- But explicitly setting here ensures it's configured.
      -- local dap = require "dap"
      -- dap.adapters.debugpy = {
      --   type = "Executable",
      --   command = "python", -- or 'python3' depending on your system
      --   args = { "-m", "debugpy.adapter" },
      -- }
      --
      -- dap.configurations.python = {
      --   {
      --     type = "debugpy",
      --     request = "launch",
      --     name = "Launch file",
      --     program = "${file}",
      --     pythonPath = function()
      --       -- Use the python interpreter from swenv if available, otherwise default
      --       local swenv = require "swenv.api"
      --       local env_path = swenv.get_current_venv_path()
      --       if env_path then
      --         return env_path .. "/bin/python"
      --       else
      --         return "python" -- Fallback to system python
      --       end
      --     end,
      --   },
      --   {
      --     type = "debugpy",
      --     request = "attach",
      --     name = "Attach to process",
      --     processId = require("dap.utils").pick_process,
      --     pythonPath = function()
      --       local swenv = require "swenv.api"
      --       local env_path = swenv.get_current_venv_path()
      --       if env_path then
      --         return env_path .. "/bin/python"
      --       else
      --         return "python"
      --       end
      --     end,
      --   },
      -- }
      --
      -- Keymaps
      local opts = { noremap = true, silent = true, desc = "" }

      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run()
      end, vim.tbl_extend("force", opts, { desc = "Run nearest test" }))

      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand "%")
      end, vim.tbl_extend("force", opts, { desc = "Run test file" }))

      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open { enter = true }
      end, vim.tbl_extend("force", opts, { desc = "Open test output" }))

      vim.keymap.set("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, vim.tbl_extend("force", opts, { desc = "Toggle test summary" }))
      -- keymap for debug nearest test
      vim.keymap.set("n", "<leader>td", function()
        neotest.run.run { strategy = "dap" }
      end, vim.tbl_extend("force", opts, { desc = "Debug nearest test" }))
      --
      -- vim.keymap.set("n", "<leader>td", function()
      --   neotest.run.run { strategy = "dap" }
      -- end, vim.tbl_extend("force", opts, { desc = "Debug nearest test" }))
      -- vim.keymap.set("n", "<leader>tB", function()
      --   require("dap.ui.widgets").toggle_line_breakpoint()
      -- end, { desc = "DAP: Toggle Breakpoint" })
    end,
  },
}
