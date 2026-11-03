-- Standalone lualine statusline theme for Gorilla Night.
local c = require("gorilla-night.palette")
local dark = c.bg_alt
local medium = c.bg_highlight
local function section_a(color)
  return { fg = c.bg, bg = color, gui = "bold" }
end
local standard = {
  a = section_a(c.orange),
  b = { fg = c.fg, bg = medium },
  c = { fg = c.fg_dim, bg = dark },
}
return {
  normal = standard,
  insert = { a = section_a(c.blue), b = standard.b, c = standard.c },
  visual = { a = section_a(c.lavender), b = standard.b, c = standard.c },
  replace = { a = section_a(c.coral), b = standard.b, c = standard.c },
  command = { a = section_a(c.yellow), b = standard.b, c = standard.c },
  terminal = { a = section_a(c.cyan), b = standard.b, c = standard.c },
  inactive = {
    a = { fg = c.muted, bg = dark },
    b = { fg = c.muted, bg = dark },
    c = { fg = c.muted, bg = dark },
  },
}
