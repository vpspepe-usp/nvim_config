local plugins = {
  {
    "benomahony/uv.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("uv").setup {
        -- Isso aqui é a mágica: ele detecta o .venv do uv e avisa o LSP
        autocmd = true,
        mappings = false,
      }

      -- Atalho para você trocar de venv manualmente se precisar
      vim.keymap.set("n", "<leader>va", "<cmd>UvSelect<cr>", { desc = "uv: Ativar Venv" })
    end,
  },
}

return plugins
