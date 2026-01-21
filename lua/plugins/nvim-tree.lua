-- ~/.config/nvim/lua/custom/plugins.lua

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    -- We use 'opts' to configure the existing plugin
    opts = {
      system_open = {
        cmd = "xdg-open", -- Ensures Linux uses xdg-open
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- 1. Load the default NvChad keymaps for the tree
        api.config.mappings.default_on_attach(bufnr)

        -- 2. Add your custom keymap
        -- Press 'o' then 'f' to open the file in external app
        vim.keymap.set("n", "<leader>of", api.node.run.system, opts "Open with System App")
      end,
    },
  },
}

return plugins
