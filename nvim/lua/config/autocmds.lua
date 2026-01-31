-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- C++ BUILD
-- Set 'makeprg' specifically for C++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- 1. Set the compiler flags (buffer-local)
    vim.opt_local.makeprg =
      "g++ -g -std=c++20 -Wall -Wextra -Weffc++ -Wconversion -Wsign-conversion -Werror -pedantic % -o %:r"

    -- 2. Map F5: Build & Run (buffer-local)
    vim.keymap.set("n", "<F5>", function()
      vim.cmd("w")
      vim.cmd("make")
      if vim.v.shell_error == 0 then
        local file = vim.fn.expand("%:p:r")
        vim.cmd("vsplit | term " .. file)
      end
    end, { buffer = true, desc = "Build and Run C++" })

    -- 3. Map F10: Run Only (buffer-local)
    vim.keymap.set("n", "<F10>", function()
      local file = vim.fn.expand("%:p:r")
      if vim.fn.filereadable(file) == 0 then
        vim.notify("Binary not found. Build first.", vim.log.levels.WARN)
        return
      end
      vim.cmd("vsplit | term " .. file)
    end, { buffer = true, desc = "Run Compiled C++ File" })
  end,
})

-- Automatically open the Quickfix list if there are errors after running :make
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "[^l]*",
  command = "cwindow",
})
