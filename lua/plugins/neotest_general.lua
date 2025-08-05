-- ~/.config/nvim/lua/plugins/neotest.lua
-- Configuração genérica e extensível para o Neotest,
-- com suporte para Python e C++.

return {
  {
    "nvim-neotest/neotest",
    -- Carrega o plugin de forma preguiçosa, mas garante que ele esteja
    -- pronto um pouco depois da inicialização, evitando erros nos atalhos.
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui", -- UI para o debugger
      "theHamsta/nvim-dap-virtual-text", -- Texto virtual para o debugger
      { "nvim-telescope/telescope.nvim", optional = true }, -- Integração opcional com Telescope

      -- =================================================================
      -- ADAPTADORES DE TESTE: Adicione todos os adaptadores aqui
      -- =================================================================
      "nvim-neotest/neotest-python", -- Para Python (pytest, unittest)
      "alfaix/neotest-gtest", -- Para C++ (Google Test), usando o que você especificou
    },
    -- ft = { "python", "cpp", "c", "javascript", "typescript" }, -- Carrega o Neotest para estas linguagens
    config = function()
      -- A variável 'neotest' só é definida depois de o plugin ser carregado.
      local neotest = require "neotest"

      -- Configuração principal do Neotest
      neotest.setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
            args = { "--maxfail=5", "--disable-warnings" },
            runner = "pytest",
            debugger = "debugpy",
          },

          require "neotest-gtest",
        },
        summary = {
          enabled = true,
        },
        output = {
          enabled = true,
          open_on_run = true,
        },
      }

      -- Configuração opcional para nvim-dap-ui, se carregado
      if package.loaded["nvim-dap-ui"] then
        require("nvim-dap-ui").setup {}
      end

      -- Configuração opcional para nvim-dap-virtual-text, se carregado
      if package.loaded["nvim-dap-virtual-text"] then
        require("nvim-dap-virtual-text").setup()
      end

      -- =================================================================
      -- ATALHOS (KEYMAPS)
      -- =================================================================
      -- Definir os atalhos aqui dentro garante que o 'neotest' já está
      -- totalmente carregado e configurado.
      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run()
      end, { desc = "Neotest: Rodar teste mais próximo" })
      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand "%")
      end, { desc = "Neotest: Rodar testes do ficheiro" })
      vim.keymap.set("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, { desc = "Neotest: Abrir/Fechar sumário" })
      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open { enter = true }
      end, { desc = "Neotest: Abrir output do teste" })
      vim.keymap.set("n", "<leader>td", function()
        neotest.run.run { strategy = "dap" }
      end, { desc = "Neotest: Depurar teste mais próximo" })

      -- Desativa temporariamente os diagnósticos do LSP durante a execução dos testes
      vim.api.nvim_create_autocmd("User", {
        pattern = "NeotestRunStarted",
        desc = "Neotest: Desativar diagnósticos durante a execução dos testes",
        callback = function()
          vim.diagnostic.disable()
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "NeotestRunCompleted",
        desc = "Neotest: Reativar diagnósticos após a execução dos testes",
        callback = function()
          vim.diagnostic.enable()
        end,
      })
    end,
  },
}
