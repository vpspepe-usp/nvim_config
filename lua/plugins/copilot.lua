-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter", -- lazy load on insert mode
--     config = function()
--       require("copilot").setup {
--         panel = {
--           enabled = true,
--           auto_refresh = true,
--           keymap = {
--             jump_prev = "[[",
--             jump_next = "]]",
--             accept = "<CR>",
--             refresh = "gr",
--             open = "<M-CR>",
--           },
--           layout = {
--             position = "bottom", -- top | bottom | left | right
--             ratio = 0.4,
--           },
--         },
--         suggestion = {
--           enabled = true,
--           auto_trigger = true,
--           debounce = 75,
--           keymap = {
--             accept = "<C-l>",
--             next = "<C-j>",
--             prev = "<C-k>",
--             dismiss = "<C-h>",
--           },
--         },
--         filetypes = {
--           yaml = true,
--           markdown = true,
--           help = false,
--           gitcommit = true,
--           gitrebase = false,
--           ["*"] = true, -- enable for all
--         },
--         copilot_node_command = "/home/vpspepe/.nvm/versions/node/v22.22.0/bin/node", --"node", -- Node.js version manager aware
--         server_opts_overrides = {},
--       }
--     end,
--   },
-- }
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {
        -- Desative a interface própria do Copilot para não conflitar com o Avante
        suggestion = {
          enabled = true, -- Isso ativa o autocomplete (Ghost Text)
          auto_trigger = true, -- Faz a sugestão aparecer sozinha ao digitar
          debounce = 75,
          keymap = {
            accept = "<C-l>", -- Atalho para aceitar a sugestão (Alt + L)
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-h>",
          },
        },
        panel = { enabled = false },
        -- Mantenha o caminho do Node que configuramos para evitar o erro de versão
        copilot_node_command = "/home/vpspepe/.nvm/versions/node/v22.22.0/bin/node",
      }
    end,
  },
}
