return {
  "barrett-ruth/live-server.nvim",
  cmd = {
    "LiveServerStart",
    "LiveServerStop",
    "LiveServerStartCustom",
  },
  opts = {},
  keys = {
    {
      "<leader>cp",
      "<cmd>LiveServerStart<CR>",
      desc = "Start Live Server",
    },
    {
      "<leader>cq",
      "<cmd>LiveServerStop<CR>",
      desc = "Stop Live Server",
    },
  },
}
