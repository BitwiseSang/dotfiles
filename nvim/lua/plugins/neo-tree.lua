return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 30, -- Reduces the default width to 30 columns
      position = "left", -- Options: "left", "right", "top", "bottom", "float"
    },
    filesystem = {
      filtered_items = {
        visible = true, -- Ensures hidden files (like .env or .gitignore) are visible
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
