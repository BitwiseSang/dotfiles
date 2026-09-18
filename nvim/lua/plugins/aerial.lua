-- aerial.nvim: persistent, navigable symbol outline panel.
-- Complements <leader>ss (snacks fuzzy LSP symbols) with a side-panel view.
-- Supports LSP, treesitter, markdown, and man page backends.
return {
  {
    "stevearc/aerial.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    -- stylua: ignore
    keys = {
      { "<leader>ce", "<cmd>AerialToggle<CR>", desc = "Toggle Symbol Outline (Aerial)" },
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      -- Attach to all windows in the current tab so the outline stays consistent
      attach_mode = "global",
      layout = {
        min_width = 28,
        resize_to_content = false,
        win_opts = {
          winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
          signcolumn = "yes",
          statuscolumn = " ",
        },
      },
      -- Filter out symbols that create noise in the outline
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package",
        "Property",
        "Struct",
        "Trait",
      },
      guides = {
        mid_item = "├╴",
        last_item = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
      },
      -- Don't clutter outline for these noisy filetypes
      ignore = {
        filetypes = { "neo-tree", "help" },
      },
    },
  },
}
