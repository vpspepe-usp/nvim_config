-- return {
--   {
--     "neovim/nvim-lspconfig",
--     -- Dependências necessárias para a configuração completa
--     dependencies = {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--       "hrsh7th/cmp-nvim-lsp", -- Assumindo que você usa nvim-cmp para autocompletar
--     },
--     ft = "python",
--     config = function()
--       local lspconfig = require "lspconfig"
--
--       -- Python LSP
--       lspconfig.pyright.setup {}
--
--       -- Global LSP keymaps
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
--       vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
--       vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
--       vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Docs" })
--       vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol", buffer = bufnr })
--     end,
--     require("mason-lspconfig").setup_handlers {
--       function(server_name)
--         require("lspconfig")[server_name].setup {
--           on_attach = on_attach,
--           -- ...
--         }
--       end,
--     },
--   },
-- }
-- ~/.config/nvim/lua/plugins/lsp_python.lua (ou melhor ainda, renomeie para lsp.lua)

return {
  {
    "neovim/nvim-lspconfig",
    -- Dependências que o lazy.nvim carregará ANTES de rodar a 'config'
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Essencial para autocompletar
    },

    -- A função config será executada após as dependências serem carregadas
    config = function()
      -- 1. Definir a função on_attach PRIMEIRO
      -- Esta função será chamada para CADA servidor LSP que se conectar a um buffer
      local on_attach = function(client, bufnr)
        -- Habilita o autocompletar via LSP (requer nvim-cmp)
        vim.api.nvim_create_autocmd("BufEnter", {
          group = vim.api.nvim_create_augroup("LspAttach_" .. bufnr, {}),
          buffer = bufnr,
          command = "lua require('cmp').setup.buffer({ sources = { { name = 'nvim_lsp' } } })",
        })

        -- 2. Definir os atalhos DENTRO do on_attach
        -- A opção 'buffer = bufnr' os torna locais e seguros
        local keymap = vim.keymap.set
        keymap("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition", buffer = bufnr })
        keymap("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration", buffer = bufnr })
        keymap("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = bufnr })
        keymap("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to Implementation", buffer = bufnr })
        keymap("n", "gr", vim.lsp.buf.references, { desc = "LSP: Find References", buffer = bufnr })
        keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol", buffer = bufnr })
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action", buffer = bufnr })
      end

      -- 3. Definir as capabilities para o autocompletar
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 4. Chamar o setup_handlers, passando as variáveis que acabamos de criar
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,
      }
    end,
  },
}

--,
--
--
--
-- -- Substitua o conteúdo do seu arquivo por este código.
-- -- É uma boa ideia renomear o arquivo para algo mais geral, como `lua/plugins/lsp.lua`
--
-- return {
--   "neovim/nvim-lspconfig",
--   -- Dependências necessárias para a configuração completa
--   dependencies = {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "hrsh7th/cmp-nvim-lsp", -- Assumindo que você usa nvim-cmp para autocompletar
--   },
--   config = function()
--     -- `on_attach` é a função que roda quando um LSP se conecta a um buffer.
--     -- É o lugar CORRETO para criar seus atalhos.
--     local on_attach = function(client, bufnr)
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
--     end
--
--     -- Capabilities são as "habilidades" que o seu cliente (Neovim) diz ao servidor que possui.
--     -- Essencial para o autocompletar funcionar.
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--     local lspconfig = require("lspconfig")
--
--     -- Handler do mason-lspconfig para configurar automaticamente os servidores instalados
--     require("mason-lspconfig").setup_handlers({
--       -- Esta função padrão vai configurar pyright, tsserver, etc., automaticamente
--       function(server_name)
--         lspconfig[server_name].setup({
--           on_attach = on_attach,
--           capabilities = capabilities,
--         })
--       end,
--     })
--   end,
-- }
