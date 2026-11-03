-- Ready-to-use lualine configuration. Requires lualine.nvim (not bundled).
local c = require("gorilla-night.palette")
local active = { fg = c.bg, bg = c.orange, gui = "bold" }
local inactive = { fg = c.fg_dim, bg = c.bg_highlight }

return {
  options = {
    theme = "gorilla-night",
  },
  tabline = {
    lualine_a = {
      { "buffers", buffers_color = { active = active, inactive = inactive } },
    },
    lualine_z = {
      { "tabs", tabs_color = { active = active, inactive = inactive } },
    },
  },
}
