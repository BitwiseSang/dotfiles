return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      dependencies = {
        "echasnovski/mini.icons",
      },
      -- Delay before showing the popup. Can be a number or a function that returns a number.
      delay = 500,
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>t", group = "test" },
          { "<leader>ce", group = "outline" },
        },
        -- Hidden keybinds
        { "<leader>1", hidden = true },
        { "<leader>2", hidden = true },
        { "<leader>3", hidden = true },
        { "<leader>4", hidden = true },
        { "<leader>5", hidden = true },
        { "<leader>6", hidden = true },
        { "<leader>7", hidden = true },
        { "<leader>8", hidden = true },
        { "<leader>9", hidden = true },
        { "<leader>e", hidden = true },
        { "<leader>E", hidden = true },
        { "<leader>l", hidden = true },
        { "<leader>L", hidden = true },
        { "<leader>/", hidden = true },
        { "<leader><space>", hidden = true },
        -- Overseer entry with icon
        { "<leader>o", group = "overseer", icon = { icon = "", color = "cyan" } },
        -- Zettelkasten Vault with icon
        { "<leader>v", group = "vault", icon = { icon = "", color = "azure" } },
      },
    },
  },
}
