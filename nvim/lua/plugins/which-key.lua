return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      table.insert(opts.spec, {
        mode = { "n", "v" },
        -- <leader>t: "test" (neotest) — <leader>tm for markdown checkbox sits here too
        { "<leader>t", group = "test" },
        -- <leader>ce: aerial symbol outline (code → explore)
        { "<leader>ce", group = "outline" },
      })
    end,
  },
}
