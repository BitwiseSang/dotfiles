return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Use clang-format for both C and C++
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
