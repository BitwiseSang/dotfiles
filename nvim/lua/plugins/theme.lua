return {
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  {
    "shaunsingh/nord.nvim",
    lazy = false, -- colorscheme must load at startup
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
