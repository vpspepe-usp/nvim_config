-- ~/.config/nvim/lua/plugins/lsp.lua
-- Este é o seu arquivo único para configurar o nvim-lspconfig e todos os servidores.

return {
  {
    "neovim/nvim-lspconfig",
    -- Gatilho para carregar o plugin. "VeryLazy" carrega logo após a inicialização.
    event = "VeryLazy",
    -- Dependências essenciais para a configuração automática.
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Necessário para as 'capabilities' do autocompletar
    },
    config = function()
      -- =================================================================
      -- 1. CONFIGURAÇÕES GLOBAIS E ÍCONES DE DIAGNÓSTICO
      -- =================================================================
      do
        -- NOTA: O código de referência usava 'LazyVim.config.icons'.
        -- Como estamos construindo do zero, substituímos por ícones Nerd Font padrão.
        local icons = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        }
        vim.diagnostic.config {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = icons.Error,
              [vim.diagnostic.severity.WARN] = icons.Warn,
              [vim.diagnostic.severity.HINT] = icons.Hint,
              [vim.diagnostic.severity.INFO] = icons.Info,
            },
          },
        }
      end

      -- =================================================================
      -- 2. ATALHOS GLOBAIS DO LSP (ON_ATTACH)
      -- =================================================================
      -- Esta função será executada para CADA servidor LSP que se conectar a um buffer.
      -- Seus atalhos personalizados, definidos de forma segura e local para o buffer.
      local keymap = vim.keymap.set
      keymap("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Ir para Definição" })
      keymap("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Ir para Declaração" })
      keymap("n", "K", vim.lsp.buf.hover, { desc = "LSP: Documentação (Hover)" })
      keymap("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Ir para Implementação" })
      keymap("n", "gr", vim.lsp.buf.references, { desc = "LSP: Encontrar Referências" })
      keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Renomear Símbolo" })
      keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Ação de Código" })

      -- =================================================================
      -- 3. CONFIGURAÇÃO DOS SERVIDORES (DEFINIÇÕES PERSONALIZADAS)
      -- =================================================================
      -- As 'capabilities' que o nvim-cmp precisa para funcionar com o LSP.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- A tabela 'servers' é onde você define configurações personalizadas
      -- para cada servidor de linguagem.
      local servers = {
        -- Para Python
        pyright = {
          -- Configurações específicas para o pyright podem ir aqui.
          -- Ex: settings = { python = { analysis = { ... } } }
        },

        -- Para C e C++
        clangd = {
          -- O clangd precisa de um 'compile_commands.json' na raiz do projeto.
          -- Argumentos de linha de comando podem ser adicionados aqui.
          -- Ex: cmd = { "clangd", "--query-driver=/usr/bin/g++" }
        },
        ruff = {
          -- Configurações específicas para o ruff_lsp (se necessário).
          -- Ex: settings = { ruff = { ... } }
        },
        gopls = {},

        -- Exemplo para Lua, com configurações detalhadas
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      }

      -- =================================================================
      -- 4. O "CÉREBRO" QUE CONECTA TUDO (CONFIGURAÇÃO EXPLÍCITA)
      -- =================================================================
      -- O mason-lspconfig garante que os servidores listados em 'ensure_installed'
      -- sejam instalados automaticamente pelo Mason.
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          -- Handler para pyright (Python)
          ["pyright"] = function()
            local server_opts = servers.pyright
            server_opts.capabilities = capabilities
            require("lspconfig").pyright.setup(server_opts)
          end,

          -- Handler para clangd (C/C++)
          ["clangd"] = function()
            local server_opts = servers.clangd
            server_opts.capabilities = capabilities
            require("lspconfig").clangd.setup(server_opts)
          end,

          -- Handler para lua_ls (Lua)
          ["lua_ls"] = function()
            local server_opts = servers.lua_ls
            server_opts.capabilities = capabilities
            require("lspconfig").lua_ls.setup(server_opts)
          end,
          ["gopls"] = function()
            local server_opts = servers.gopls
            server_opts.capabilities = capabilities
            require("lspconfig").gopls.setup(server_opts)
          end,

          -- Handler padrão para qualquer outro servidor que você instalar
          -- via :MasonInstall, mas não configurou explicitamente acima.
          ["*"] = function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,
        },
      }
    end,
  },
}
