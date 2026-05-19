return {
  -- {
  --   "lervag/vimtex",
  --   lazy = false, -- VimTeX recomenda carregar no início para detecção de ficheiros .tex
  --   init = function()
  --     -- Configuração básica
  --     vim.g.vimtex_view_method = "zathura" -- Recomendado para Linux/Pop!_OS
  --     vim.g.vimtex_compiler_method = "latexmk"
  --     -- Impede que o VimTeX abra a janela de erros automaticamente
  --     vim.g.vimtex_quickfix_mode = 0
  --   end,
  -- },
  --
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_progname = "nvr"
      -- Tenta abrir o PDF mesmo que o Forward Search falhe
      -- Garante que o VimTeX não ignore o PDF se ele demorar a compilar
      -- 2. DESATIVA a abertura automática ao compilar
      vim.g.vimtex_view_automatic = 0

      -- 3. DESATIVA a abertura ao iniciar a compilação (forward search)
      vim.g.vimtex_view_forward_search_on_start = 0

      -- Opcional: Impede que a janela de erros (Quickfix) salte sozinha
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_latexmk = {

        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },
  {
    "conornewton/vim-latex-preview",
    ft = "tex",
    lazy = false,
  },
}
