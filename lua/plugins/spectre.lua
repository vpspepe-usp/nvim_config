return {
  {
    "nvim-pack/nvim-spectre",
    -- Opcional, mas recomendado para ícones bonitos
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- A chave 'keys' é a forma mais limpa de definir atalhos e
    -- carregar o plugin de forma preguiçosa (lazy-loading).
    keys = {
      {
        "<leader>sp",
        function()
          require("spectre").open()
        end,
        desc = "Spectre: Substituir no projeto",
      },
      {
        "<leader>sf",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Spectre: Substituir no arquivo atual",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual { select_word = true }
        end,
        desc = "Spectre: Substituir a palavra sob o cursor",
      },
      {
        "<leader>s",
        function()
          require("spectre").open_visual()
        end,
        mode = "v",
        desc = "Spectre: Substituir na seleção visual",
      },
    },
  },
}
