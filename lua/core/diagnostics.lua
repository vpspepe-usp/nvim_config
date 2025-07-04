-- ~/.config/nvim/lua/core/diagnostics.lua

-- Define os ícones que aparecerão na calha (gutter) ao lado dos números das linhas.
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Configura como o Neovim vai exibir os diagnósticos.
vim.diagnostic.config {
  -- Mostra os diagnósticos como texto virtual no final da linha.
  -- Muito útil para ver o erro sem precisar parar o cursor em cima.
  virtual_text = true,

  -- Mostra os ícones (sinais) que definimos acima.
  signs = true,

  -- Sublinha o código com o erro.
  underline = true,

  -- Não atualizar diagnósticos enquanto estiver no modo de inserção.
  -- Mudar para 'true' pode causar lag em arquivos grandes. O padrão (false) é mais seguro.
  update_in_insert = false,

  -- Ordena os diagnósticos por severidade. Erros aparecem primeiro.
  severity_sort = true,

  -- Configura a janela flutuante que aparece com K ou `vim.diagnostic.open_float`.
  float = {
    source = "always", -- Mostra a fonte do diagnóstico (ex: 'pyright')
    border = "rounded",
  },
}

-- Mude a cor de fundo da janela flutuante para ser mais parecida com o resto do editor.
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { link = "Normal" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { link = "Normal" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { link = "Normal" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { link = "Normal" })

-- Atalhos para navegar pelos diagnósticos.
-- Estes são globais e funcionarão em qualquer buffer.
local keymap = vim.keymap.set
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to Previous Diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show Diagnostics in Loclist" })
