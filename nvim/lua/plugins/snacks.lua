return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    picker = {
      sources = {
        colorschemes = {
          transform = function(item)
            local allowed = {
              ["nord"] = true,
            }
            return allowed[item.text] and item or false
          end,
        },
      },
    },
  },
}
