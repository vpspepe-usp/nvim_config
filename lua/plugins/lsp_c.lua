return {
  {
    -- "neovim/nvim-lspconfig",
    -- -- A chave 'ft' é a mais importante aqui.
    -- -- Ela diz ao lazy.nvim para carregar este plugin APENAS
    -- -- quando você abrir um arquivo C ou C++.
    --
    -- -- Dependências essenciais para que o clangd seja encontrado e configurado.
    -- dependencies = {
    --   "williamboman/mason.nvim",
    --   "williamboman/mason-lspconfig.nvim",
    --   "hrsh7th/cmp-nvim-lsp", -- Assumindo que você usa nvim-cmp para autocompletar
    -- },
    -- ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    --
    -- config = function()
    --   -- Configuração do lspconfig para o clangd.
    --   require("lspconfig").clangd.setup {
    --     on_attach = function(client, bufnr)
    --       -- Mensagem para sabermos que funcionou (opcional)
    --       vim.notify("LSP attached: " .. client.name)
    --
    --       -- Cria os atalhos APENAS para este buffer
    --       local opts = { buffer = bufnr, noremap = true, silent = true }
    --       local keymap = vim.keymap.set
    --
    --       -- Seus atalhos, agora seguros e locais para o buffer
    --       keymap("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition", buffer = bufnr })
    --       keymap("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration", buffer = bufnr })
    --       keymap("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to Implementation", buffer = bufnr })
    --       keymap("n", "gr", vim.lsp.buf.references, { desc = "LSP: Find References", buffer = bufnr })
    --       keymap("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Docs", buffer = bufnr })
    --       keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action", buffer = bufnr })
    --     end,
    --   }
    -- end,
  },
}
