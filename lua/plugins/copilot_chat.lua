return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    -- lazy = false, -- Load this plugin immediately
    event = "VeryLazy", -- Load on very lazy event
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
    -- },
    keys = {
      -- Abrir/Fechar o painel principal do chat
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle Chat" },

      -- Ações rápidas (não abrem o painel, mostram em um float)
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain Code (Quick)" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate Tests (Quick)" },
      { "<leader>cT", "<cmd>CopilotChatType<cr>", desc = "CopilotChat - Add Types (Quick)" },

      -- Ações que usam a seleção visual e abrem o painel para uma conversa
      {
        "<leader>cv", -- "Copilot View/Ask"
        function()
          require("CopilotChat").ask_selection()
        end,
        mode = "v",
        desc = "CopilotChat - Ask about selected code",
      },

      -- Gerar um commit message com base nas mudanças do git
      { "<leader>cm", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Generate Commit Message" },

      -- Usar o poder do Telescope para selecionar prompts pré-definidos
      { "<leader>cp", "<cmd>CopilotChatPrompts<cr>", desc = "CopilotChat - Prompts (Telescope)" },
    },
    --     },
    -- config = function() end,
  },
}
