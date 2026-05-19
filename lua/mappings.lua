-- lua/mappings.lua
require "nvchad.mappings"

local map = vim.keymap.set

-- 1. Edição e Interface
map("i", "jk", "<ESC>", { desc = "Sair do modo de inserção" })
map("n", "<leader>rN", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle Relative Number" })

-- Mover linhas (Alt + j/k)
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- 2. Gestão de Buffers e Busca (Telescope)
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Fechar Buffer suavemente" })

map("n", "<leader>bk", "<cmd>bd<cr>", { desc = "Fechar Buffer (Kill)" })
map("n", "<leader>bf", "<cmd>Telescope builtin buffers<CR>", { desc = "Telescope: Listar Buffers" })
map("n", "<leader>sd", "<cmd>Telescope builtin grep_string<CR>", { desc = "Search: Palavra sob o cursor" })

-- 3. Plugins (DAP, Todo-Comments, LaTeX)
map("n", "<leader>tB", function()
  require("dap.ui.widgets").toggle_line_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })

map("n", "]t", function()
  require("todo-comments").jump_next { keywords = { "ERROR", "WARNING" } }
end, { desc = "Next error/warning todo" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Atalhos novos para o VimTeX (LaTeX)
map("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "LaTeX: Compilar" })
map("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "LaTeX: Ver PDF" })
map("n", "<leader>lt", "<cmd>VimtexTocToggle<cr>", { desc = "LaTeX: Sumário" })

-- 4. Utilitários de Sistema (Abrir ficheiros externamente)
map("n", "<leader>op", function()
  local file = vim.fn.expand "%:p"
  vim.fn.jobstart({ "xdg-open", file }, { detach = true })
end, { desc = "Open PDF externally" })

map("n", "<leader>oi", function()
  local file = vim.fn.expand "%:p"
  -- No cluster podes precisar de ajustar 'open' para 'xdg-open' também
  vim.fn.jobstart({ "open", file }, { detach = true })
end, { desc = "Open Image Externally" })
