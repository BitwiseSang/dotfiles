return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      win = {
        border = "none",
        noautocmd = true,
        padding = { 0, 2 },
        wo = {
          winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
        },
      },
      layout = {
        align = "left",
      },
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
      },
    },
  },
}
