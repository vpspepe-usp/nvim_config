vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

neoscroll = require "neoscroll"
local keymap = {
  ["<C-u>"] = function()
    neoscroll.ctrl_u { duration = 250 }
  end,
  ["<C-d>"] = function()
    neoscroll.ctrl_d { duration = 250 }
  end,
  ["<C-b>"] = function()
    neoscroll.ctrl_b { duration = 450 }
  end,
  ["<C-f>"] = function()
    neoscroll.ctrl_f { duration = 450 }
  end,
  ["<C-y>"] = function()
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
  end,
  ["<C-e>"] = function()
    neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
  end,
  ["zt"] = function()
    neoscroll.zt { half_win_duration = 250 }
  end,
  ["zz"] = function()
    neoscroll.zz { half_win_duration = 250 }
  end,
  ["zb"] = function()
    neoscroll.zb { half_win_duration = 250 }
  end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
-- require("CopilotChat").setup {
--   -- Add any specific configuration for Copilot Chat here
--   -- For example, you can set the provider or other options
-- }
require "keymaps"
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"
require "core.diagnostics"

vim.schedule(function()
  require "mappings"
end)
