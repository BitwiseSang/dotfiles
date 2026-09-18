return {
  "lervag/vimtex",
  ft = { "tex", "latex", "plaintex" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end,
}
