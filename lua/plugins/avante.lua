return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    -- THIS IS THE CRITICAL PART:
    build = "make",
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
    },
    -- behaviour = {
    --   auto_suggestions = false, -- Desative isso se o erro persistir, pois gera muitas requisições
    --   auto_set_highlight_group = true,
    --   auto_set_keymaps = true,
    -- },
    -- Limita o que o Avante envia para a IA
    -- hints = { enabled = false }, -- Desativa as dicas flutuantes que gastam tokens
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
          },
        },
      },
      {
        -- Make sure setup is called for render-markdown
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
