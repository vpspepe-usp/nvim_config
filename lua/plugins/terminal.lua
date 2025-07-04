-- In your plugins file (e.g., plugins/terminal.lua)
return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    -- version = "*", -- or pin to a specific version
    config = function()
      require("toggleterm").setup {
        -- size can be a number or a function which is passed the current terminal
        size = function(term)
          if term.direction == "horizontal" then
            return 15 -- 15 lines high
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4 -- 40% of the screen width
          end
        end,
        open_mapping = [[<c-\>]], -- A common mapping to toggle the terminal
        hide_numbers = true, -- hide line numbers for the terminal
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2, -- '1'|'2'|'3' - darker shades require more memory
        start_in_insert = true,
        insert_mappings = true, -- allows you to use your insert mappings in the terminal
        persist_size = true,
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        float_opts = {
          -- The border key is terrible styling, but demonstrates the available options
          border = "curved", -- 'single'|'double'|'shadow'|'curved'
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      }

      -- Define a keymap to easily toggle the terminal
      vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

      -- A useful function to set terminal mappings only for toggleterm
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts) -- Example: jk to escape
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
    end,
  },
}
