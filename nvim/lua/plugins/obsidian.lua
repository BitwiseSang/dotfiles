return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- global: work from any buffer
      { "<leader>vn", "<cmd>ObsidianNew<cr>", desc = "New note (inbox)" },
      { "<leader>vN", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New note from template" },
      { "<leader>vf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find note" },
      { "<leader>vg", "<cmd>ObsidianSearch<cr>", desc = "Grep notes" },
      { "<leader>vd", "<cmd>ObsidianToday<cr>", desc = "Today's journal" },
      { "<leader>vy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's journal" },
      -- markdown buffers only: these act on the current note
      { "<leader>vb", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks", ft = "markdown" },
      { "<leader>vt", "<cmd>ObsidianTemplate<cr>", desc = "Insert template", ft = "markdown" },
      { "<leader>vr", "<cmd>ObsidianRename<cr>", desc = "Rename + fix links", ft = "markdown" },
      { "<leader>vT", "<cmd>ObsidianTags todo<cr>", desc = "Find todos", ft = "markdown" },
    },
    opts = {
      workspaces = {
        { name = "notes", path = "~/notes" },
      },

      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",

      daily_notes = {
        folder = "daily", -- relative to the vault root
        date_format = "%Y-%m-%d",
        default_tags = { "daily" },
        template = "daily.md",
      },

      templates = {
        folder = "templates", -- if this errors on your version, rename to `subdir`
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      note_id_func = function(title)
        local slug = title and title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower() or tostring(os.time())
        return os.date("%Y%m%d%H%M") .. "-" .. slug
      end,

      preferred_link_style = "wiki",

      completion = { nvim_cmp = false, min_chars = 2 }, -- see note on blink below
      ui = { enable = false }, -- render-markdown.nvim handles this
      follow_url_func = function(url)
        vim.ui.open(url)
      end, -- default is macOS-only
      picker = { name = "fzf-lua" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = { spec = { { "<leader>z", group = "zettelkasten" } } },
  },
}
