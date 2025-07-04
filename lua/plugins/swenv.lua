return {
  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup({
        -- Add all the directory names you use for virtual environments.
        -- swenv will search for these in your project root when auto_venv is enabled.
        venv_names = {
          ".virtualenvs",
          ".env",
          ".dist",
          ".venv", -- Default value
          "venv",   -- Default value
        },

        -- Keep auto-detection enabled
        auto_venv = true,

        -- Optional: Path to a centralized directory for other virtual environments
        -- This is for the :Swenv Telescope picker, not for auto-detection.
        venvs_path = vim.fn.expand("~/.virtualenvs"),

        -- Optional but recommended: Restart LSP after changing environments
        post_set_venv = function()
          print("Swenv: LSP Restarting...")
          vim.cmd("LspRestart")
        end,
      })
    end,
  },
}
