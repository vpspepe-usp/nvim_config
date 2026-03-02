require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer: Fechar Aba" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
