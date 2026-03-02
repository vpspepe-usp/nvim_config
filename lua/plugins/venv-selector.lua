return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    branch = "regexp", -- This branch is recommended for newer Neovim versions
    config = function()
      require("venv-selector").setup {
        settings = {
          search = {
            -- Tell the plugin to look specifically for uv-style .venv folders
            my_uv_venvs = {
              command = "fd --type d --name .venv --max-depth 2",
            },
          },
        },
      }
      -- Keybinding to open the selector
      vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select VirtualEnv" })
    end,
  },
}
