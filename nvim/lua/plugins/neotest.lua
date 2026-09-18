-- neotest: test runner integration for Ruby (RSpec) and Python (pytest).
-- The lang.ruby and lang.python LazyVim extras each add their adapter as an
-- optional neotest dependency, so declaring neotest here activates both.
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Adapters — lang.ruby and lang.python extras inject theirs here too
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-python",
      "marilari88/neotest-vitest",
    },
    -- stylua: ignore
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,  desc = "Run File Tests" },
      { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end,        desc = "Run All Tests" },
      { "<leader>tr", function() require("neotest").run.run() end,                    desc = "Run Nearest" },
      { "<leader>tl", function() require("neotest").run.run_last() end,               desc = "Run Last" },
      { "<leader>ts", function() require("neotest").summary.toggle() end,             desc = "Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end,        desc = "Toggle Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end,                   desc = "Stop" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
    },
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true },
    },
    config = function(_, opts)
      -- Instantiate adapters: name → config table pattern
      -- Merged opts.adapters comes from this spec + lang extras (ruby, python)
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        local ok, adapter = pcall(require, name)
        if ok then
          local adapter_opts = type(config) == "table" and config or {}
          local meta = getmetatable(adapter)
          if adapter.setup then
            adapter.setup(adapter_opts)
          elseif adapter.adapter then
            adapter.adapter(adapter_opts)
            adapter = adapter.adapter
          elseif meta and meta.__call then
            adapter = adapter(adapter_opts)
          end
          table.insert(adapters, adapter)
        end
      end
      opts.adapters = adapters
      require("neotest").setup(opts)
    end,
  },

  -- Override: use bundler-scoped rspec binary, consistent with ruby-lsp's bundle exec setup
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = function()
            return vim.tbl_flatten({ "bundle", "exec", "rspec" })
          end,
        },
        ["neotest-python"] = {
          runner = "pytest",
        },
        ["neotest-vitest"] = {},
      },
    },
  },
}
