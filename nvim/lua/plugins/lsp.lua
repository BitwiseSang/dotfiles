return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        cmd = { "bundle", "exec", "ruby-lsp" }, -- Ensure it runs in bundle context
        init_options = {
          formatter = "auto",
          linters = { "rubocop" },
        },
      },
    },
    setup = {
      rubocop = function()
        return true -- returning true disables the setup for this server
      end,
    },
  },
}
