return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- Usamos a função opts para estender a configuração padrão do NvChad
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      -- 1. Mapeamento de Teclas (Correção para navegação)
      opts.mapping = {

        -- Navegar com Ctrl+N / Ctrl+P (Padrão Vim)
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),

        -- Navegar com Tab (Inteligentemente verifica snippets)
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Confirmar com Enter
        ["<CR>"] = cmp.mapping.confirm { select = true },

        -- Abrir menu manualmente com Ctrl+Space
        ["<C-Space>"] = cmp.mapping.complete(),
      }

      -- 2. Ordenação: Garante que a prioridade (score) seja respeitada
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          require("cmp.config.compare").offset,
          require("cmp.config.compare").exact,
          require("cmp.config.compare").score, -- Isso faz o group_index funcionar
          require("cmp.config.compare").recently_used,
          require("cmp.config.compare").kind,
        },
      }

      -- 3. Fontes: Define que o LSP (Pyright) é prioridade 1
      opts.sources = {
        { name = "nvim_lsp", group_index = 1 }, -- Pyright aparece primeiro
        { name = "luasnip", group_index = 1 }, -- Snippets aparecem primeiro

        -- { name = "copilot", group_index = 2 }, -- Copilot aparece depois (ou desativado)
        { name = "buffer", group_index = 2 },
        { name = "path", group_index = 2 },
      }

      return opts
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   -- Usamos a função opts para estender a configuração padrão do NvChad
  --   opts = function(_, opts)
  --     local cmp = require "cmp"
  --
  --     -- 1. Ordenação: Garante que a prioridade (score) seja respeitada
  --     opts.sorting = {
  --       priority_weight = 2,
  --       comparators = {
  --         require("cmp.config.compare").offset,
  --         require("cmp.config.compare").exact,
  --         require("cmp.config.compare").score, -- Isso faz o group_index funcionar
  --         require("cmp.config.compare").recently_used,
  --         require("cmp.config.compare").kind,
  --       },
  --     }
  --
  --     -- 2. Fontes: Define que o LSP (Pyright) é prioridade 1 e Copilot é 2
  --     opts.sources = {
  --       { name = "nvim_lsp", group_index = 1 }, -- Pyright aparece primeiro
  --       { name = "luasnip", group_index = 1 }, -- Snippets aparecem primeiro
  --
  --       -- { name = "copilot", group_index = 2 }, -- Copilot aparece depois
  --       { name = "buffer", group_index = 2 },
  --       { name = "path", group_index = 2 },
  --     }
  --
  --     return opts
  --   end,
  -- },

  -- ~/.config/nvim/lua/custom/plugins/init.lua
  -- This is where you add your custom plugins.
  -- Each plugin is defined as a table within this main 'return {}' table.
  -- NvChad's core plugins are typically loaded elsewhere, so you just add yours here.
  -- Example for ~/.config/nvim/lua/plugins/auto-session.lua
  -- {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup({
  --       auto_restore_last_session = false, -- THIS MUST BE FALSE
  --       auto_session_sync_cwd = true, -- Keep this true for normal operation
  --       bypass_netrw_error = true,
  --       enabled = true,
  --       log_level = 2,
  --       -- Also, double-check your vim.opt.sessionoptions in options.lua as well.
  --       -- It should have 'localoptions' appended.
  --     })
  --   end,
  --   -- ...
  -- },
  -- --- auto-session plugin ---
  --   {
  --   "richardhapb/pytest.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter", -- Dependency for pytest.nvim
  --   },
  --   -- The 'opts' table and 'config' function are together here.
  --   -- 'opts' is automatically passed to the 'config' function as the second argument.
  --   opts = {
  --     add_args = { "-vv" }, -- Example: add verbose output to pytest runs
  --     -- docker = { enabled = true, container = "my-dev-container" },
  --     -- django = { enabled = true, django_settings_module = "myproject.settings.test" },
  --   },
  --   config = function(_, opts) -- '_opts' captures the 'opts' table defined above
  --     require("pytest").setup(opts) -- Pass the captured 'opts' to the plugin's setup function
  --     -- Keybindings for pytest.nvim
  --     vim.keymap.set("n", "<leader>rt", "<CMD>Pytest<CR>", { desc = "Run Pytest (current file)" })
  --     vim.keymap.set("n", "<leader>rto", "<CMD>PytestOutput<CR>", { desc = "Show Pytest Output" })
  --   end,
  -- },
  --
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
