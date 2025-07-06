-- ~/.config/nvim/lua/configs/treesitter.lua
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "python", -- MUST be here
    "xml", -- MUST be here
    "csv",
    "json",
    "javascript",
    "typescript",
    "html",
    "css",
    "bash",
    "markdown",
    "markdown_inline",
    "c",
    "cpp",

    -- ... other languages
  },
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true, -- <--- Ensure this is true
  -- ... rest of your config
}
