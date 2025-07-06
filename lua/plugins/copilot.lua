-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       -- require("copilot").setup {}
--       require("copilot").setup {
--         panel = {
--           enabled = true,
--           auto_refresh = false,
--           keymap = {
--             jump_prev = "[[",
--             jump_next = "]]",
--             accept = "<CR>",
--             refresh = "gr",
--             open = "<M-CR>",
--           },
--           layout = {
--             position = "bottom", -- | top | left | right
--             ratio = 0.4,
--           },
--         },
--         suggestion = {
--           enabled = true,
--           auto_trigger = false,
--           debounce = 75,
--           keymap = {
--             accept = "<M-l>",
--             accept_word = false,
--             accept_line = false,
--             next = "<M-]>",
--             prev = "<M-[>",
--             dismiss = "<C-]>",
--           },
--         },
--         filetypes = {
--           yaml = false,
--           markdown = false,
--           help = false,
--           gitcommit = false,
--           gitrebase = false,
--           hgcommit = false,
--           svn = false,
--           cvs = false,
--           ["."] = false,
--         },
--         copilot_node_command = "node", -- Node.js version must be > 16.x
--         server_opts_overrides = {},
--       }
--     end,
--         cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)
--
-- cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false
-- end)
--         require("copilot.suggestion").is_visible()
-- require("copilot.suggestion").accept(modifier)
-- require("copilot.suggestion").accept_word()
-- require("copilot.suggestion").accept_line()
-- require("copilot.suggestion").next()
-- require("copilot.suggestion").prev()
-- require("copilot.suggestion").dismiss()
-- require("copilot.suggestion").toggle_auto_trigger()
--   },
--
-- {
--
--   "github/copilot.vim",
--
-- lazy = false,
-- },
--}

-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     -- Both `cmd` and `event` are used. `InsertEnter` makes it load when you start typing.
--     -- `cmd` makes sure you can use chat commands even without entering insert mode.
--     cmd = "Copilot",
--     event = "InsertEnter",
--     -- The `keys` table is the modern lazy.nvim way to add keymaps for a plugin.
--     keys = {
--       {
--         "<leader>ce",
--         "<cmd>Copilot explain<cr>",
--         mode = "v", -- Visual mode only
--         desc = "Copilot - Explain selection",
--       },
--       {
--         "<leader>cf",
--         "<cmd>Copilot fix<cr>",
--         mode = "v", -- Visual mode only
--         desc = "Copilot - Fix selection",
--       },
--       {
--         "<leader>cc",
--         function()
--           local input = vim.fn.input "Copilot Chat: "
--           if input ~= "" then
--             vim.cmd("Copilot " .. input)
--           end
--         end,
--         desc = "Copilot - Chat",
--       },
--     },
--     -- Use `opts` for configuration that is passed directly to the plugin's `setup()` function.
--     -- This is cleaner than using `config = function() ... end` for simple setups.
--     opts = {
--       panel = {
--         enabled = true,
--         auto_refresh = false,
--         keymap = {
--           jump_prev = "[[",
--           jump_next = "]]",
--           accept = "<CR>",
--           refresh = "gr",
--           open = "<M-CR>",
--         },
--         layout = {
--           position = "bottom", -- | top | left | right
--           ratio = 0.4,
--         },
--       },
--       suggestion = {
--         enabled = true,
--         auto_trigger = false, -- You have this set to false, so you will need to trigger it manually.
--         debounce = 75,
--         keymap = {
--           accept = "<M-l>",
--           accept_word = false,
--           accept_line = false,
--           next = "<M-]>",
--           prev = "<M-[>",
--           dismiss = "<C-]>",
--         },
--       },
--       filetypes = {
--         yaml = false,
--         markdown = false,
--         help = false,
--         gitcommit = false,
--         gitrebase = false,
--         hgcommit = false,
--         svn = false,
--         cvs = false,
--         ["."] = false,
--       },
--       copilot_node_command = "node", -- Node.js version must be > 16.x
--       server_opts_overrides = {},
--     },
--   },
-- }

-- ~/.config/nvim/lua/plugins/copilot.lua

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter", -- lazy load on insert mode
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- top | bottom | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-h>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          ["*"] = true, -- enable for all
        },
        copilot_node_command = "node", -- Node.js version manager aware
        server_opts_overrides = {},
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    config = function() end,
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
    -- ~/.config/nvim/lua/plugins/copilot_chat.lua

    --   {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     -- A branch 'canary' tem as funcionalidades mais recentes e é a recomendada
    --     -- branch = "canary",
    --     dependencies = {
    --       { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
    --       { "nvim-lua/plenary.nvim" }, -- Dependência de utilitários
    --       { "nvim-telescope/telescope.nvim" }, -- Opcional, para uma melhor seleção de prompts
    --     },
    --     opts = {
    --       -- Configurações da janela do chat
    --       window = {
    --         layout = "vertical",
    --         width = 0.5,
    --         height = 0.9,
    --       },
    --       -- Mostra o que o Copilot está "pensando" (ex: [Copilot] ✨ Elaborating)
    --       show_folds = true,
    --     },
    --     -- ===================================================================
    --     -- AQUI ESTÁ A SEÇÃO DE ATALHOS MELHORADA
    --     -- ===================================================================
    --     keys = {
    --       -- Abrir/Fechar o painel principal do chat
    --       { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle Chat" },
    --
    --       -- Ações rápidas (não abrem o painel, mostram em um float)
    --       { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain Code (Quick)" },
    --       { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate Tests (Quick)" },
    --       { "<leader>cT", "<cmd>CopilotChatType<cr>", desc = "CopilotChat - Add Types (Quick)" },
    --
    --       -- Ações que usam a seleção visual e abrem o painel para uma conversa
    --       {
    --         "<leader>cv", -- "Copilot View/Ask"
    --         function()
    --           require("CopilotChat").ask_selection()
    --         end,
    --         mode = "v",
    --         desc = "CopilotChat - Ask about selected code",
    --       },
    --
    --       -- Gerar um commit message com base nas mudanças do git
    --       { "<leader>cm", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Generate Commit Message" },
    --
    --       -- Usar o poder do Telescope para selecionar prompts pré-definidos
    --       { "<leader>cp", "<cmd>CopilotChatPrompts<cr>", desc = "CopilotChat - Prompts (Telescope)" },
    --     },
  },
}
