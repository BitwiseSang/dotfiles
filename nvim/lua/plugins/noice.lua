return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = false, -- Renders the cmdline at the bottom standard area
      },
      messages = {
        enabled = false, -- Disables Noice message routing, letting native Neovim print them at the bottom
      },
      -- Disable the floating search/command palette preset if it's active
      presets = {
        bottom_search = true,
        command_palette = false,
      },
      search_up = {
        view = "cmdline",
      },
    },
  },
}
