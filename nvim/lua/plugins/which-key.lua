return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      -- Add the new group to the existing spec
      opts.spec = opts.spec or {}
      table.insert(opts.spec, {
        mode = { "n", "v" }, -- Normal and Visual mode
        { "<leader>t", group = "toggle" }, -- Assign name "toggle" to leader + t
      })
    end,
  },
}
