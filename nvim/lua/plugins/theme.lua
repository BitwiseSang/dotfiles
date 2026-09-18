return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- colorscheme must load at startup
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
