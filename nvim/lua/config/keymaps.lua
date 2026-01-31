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

-- Compile C++ with F9
vim.keymap.set("n", "<F9>", "<cmd>w<cr><cmd>make<cr>", { desc = "Build C++ File" })

-- F5: Build & Run (The "God Key")
vim.keymap.set("n", "<F5>", function()
  vim.cmd("w") -- 1. Save the file
  vim.cmd("make") -- 2. Run the compiler (your autocmd handles the error window)

  -- 3. If compile succeeded (exit code 0), run the program
  if vim.v.shell_error == 0 then
    local file = vim.fn.expand("%:r") -- Get filename without extension
    vim.cmd("vsplit | term " .. file) -- Open terminal in split
  end
end, { desc = "Build and Run C++" })

-- F10: Run Only (Skip compilation)
vim.keymap.set("n", "<F10>", function()
  local file = vim.fn.expand("%:r")
  vim.cmd("vsplit | term " .. file)
end, { desc = "Run Compiled C++ File" })
