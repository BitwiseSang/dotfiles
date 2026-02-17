return {
  -- 1. Configure the LSP (Keep your existing settings)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { "bundle", "exec", "ruby-lsp" },
        },
        -- Keep explicitly disabling the rubocop LSP to avoid duplicates
        rubocop = {
          enabled = false,
        },
      },
    },
  },

  -- 2. Enable nvim-lint for RuboCop which brings back error highlighting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ruby = { "rubocop" },
      },
    },
  },

  -- 3. Ensure Conform is using RuboCop for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
      },
    },
  },
}
