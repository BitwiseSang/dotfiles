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

    -- 2. Map F9: Build Only (buffer-local)
    vim.keymap.set("n", "<F9>", "<cmd>w<cr><cmd>make<cr>", { buffer = true, desc = "Build C++ File" })

    -- 3. Map F5: Build & Run (buffer-local)
    vim.keymap.set("n", "<F5>", function()
      vim.cmd("w")
      vim.cmd("make")
      if vim.v.shell_error == 0 then
        local file = vim.fn.expand("%:p:r")
        vim.cmd("vsplit | term " .. file)
      end
    end, { buffer = true, desc = "Build and Run C++" })

    -- 4. Map F10: Run Only (buffer-local)
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

-- A1: Diagnostic virtual text icons — add shape prefix so severity is not color-only.
-- Runs on VeryLazy to extend whatever LazyVim has already configured.
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    local existing_vt = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
      virtual_text = vim.tbl_deep_extend("force", type(existing_vt) == "table" and existing_vt or {}, {
        prefix = function(diagnostic)
          local icons = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          }
          return icons[diagnostic.severity] or ""
        end,
      }),
    })
  end,
})

-- A2: WinSeparator — tint to Comment fg so the active-split edge is visible
-- against a transparent background. Re-applied on every colorscheme change.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("user_win_separator", { clear = true }),
  pattern = "*",
  callback = function()
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Comment", link = false })
    if ok and hl and hl.fg then
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = hl.fg, bg = "none" })
    end
  end,
})
