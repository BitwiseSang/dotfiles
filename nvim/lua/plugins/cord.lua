return {
  "vyfor/cord.nvim",
  event = "VeryLazy",
  -- Only activate when Discord is actually running (avoids a background process per tmux pane)
  cond = function()
    return vim.fn.glob("/tmp/discord-ipc-*") ~= ""
  end,
  opts = {},
}
