-- diffview.nvim: visual git diff viewer, file history browser, and 3-way merge tool.
-- Pairs with gitsigns (hunk-level staging) and snacks git (blame/log) — each covers
-- a different scope. Diffview handles commit history and conflict resolution.
return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
      "DiffviewRefresh",
    },
    -- stylua: ignore
    keys = {
      { "<leader>gv",  "<cmd>DiffviewOpen<CR>",            desc = "Diffview Open" },
      { "<leader>gV",  "<cmd>DiffviewClose<CR>",           desc = "Diffview Close" },
      { "<leader>gH",  "<cmd>DiffviewFileHistory<CR>",     desc = "Branch File History" },
      -- Current-file history lives under <leader>gh (gitsigns hunks group → history leaf)
      { "<leader>ghh", "<cmd>DiffviewFileHistory %<CR>",   desc = "File History (Diffview)" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
        merge_tool = {
          -- 3-way split for conflict resolution: LOCAL | BASE | REMOTE
          layout = "diff3_mixed",
          disable_diagnostics = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
      },
    },
  },
}
