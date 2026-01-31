return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rubocop = {
        -- Overriding the default command to use 'bundle exec'
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        -- Optional: ensure it runs only if a Gemfile is found
        root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
      },
    },
  },
}
