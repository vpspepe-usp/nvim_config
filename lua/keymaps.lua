local map = vim.keymap.set
vim.keymap.set("n", "<leader>op", function()
  local file = vim.fn.expand "%:p"
  vim.fn.jobstart({ "xdg-open", file }, { detach = true })
end, { desc = "Open PDF externally" })

vim.keymap.set("n", "<leader>tB", function()
  require("dap.ui.widgets").toggle_line_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })

map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)   
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { silent = true, noremap = true , desc = "Search current word" })
