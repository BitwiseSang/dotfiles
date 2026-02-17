-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = false

-- Line wrapping configurations
vim.opt.wrap = true
vim.opt.linebreak = true
-- vim.opt.showbreak = "󱞩 "

-- Disabling swap files
vim.opt.swapfile = false

-- Set the maximum width for soft-wrapping and formatting (gq)
vim.opt.textwidth = 80

-- 't' = auto-wrap text using 'textwidth'
-- 'c' = auto-wrap comments using 'textwidth'
vim.opt.formatoptions:append("t")

-- LSP Server to use for Rust
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
