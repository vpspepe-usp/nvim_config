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
}
