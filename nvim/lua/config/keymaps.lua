-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map 'jj' to Escape in Insert mode
vim.keymap.set("i", "jj", "<Esc>", {
  desc = "Exit Insert mode with jj", -- Description for which-key (if installed)
  noremap = true, -- Non-recursive mapping
  silent = true, -- Execute silently
})

-- Map 'jj' to Escape in Insert mode in the termimal

vim.keymap.set("t", "jj", "<C-\\><C-n>", {
  desc = "Exit Terminal mode with jj",
  noremap = true,
  silent = true,
})

-- Fix for the End key being interpreted as <Select>
vim.keymap.set({ "n", "v", "i" }, "<Select>", "<End>", { noremap = true })

-- Move selected lines up/down in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move selection down",
  noremap = true,
  silent = true,
})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
  desc = "Move selection up",
  noremap = true,
  silent = true,
})
