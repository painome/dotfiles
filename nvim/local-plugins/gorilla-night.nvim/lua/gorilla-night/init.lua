local M = {}

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "gorilla-night"

  local palette = require("gorilla-night.palette")
  local settings = require("gorilla-night.config")
  local modules = { "editor", "syntax", "treesitter", "lsp", "plugins" }
  for _, name in ipairs(modules) do
    local groups = require("gorilla-night.groups." .. name)(palette)
    if not settings.transparent then
      local restore = { Normal = true, NormalNC = true, NormalFloat = true, NormalSB = true, SignColumn = true, FoldColumn = true, NvimTreeNormal = true, NvimTreeNormalNC = true, NeoTreeNormal = true, NeoTreeNormalNC = true }
      for group, spec in pairs(groups) do
        if restore[group] and spec.bg == "NONE" then spec.bg = palette.bg end
      end
    end
    for group, spec in pairs(groups) do
      vim.api.nvim_set_hl(0, group, spec)
    end
  end

  vim.g.terminal_color_0 = palette.bg
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.orange
  vim.g.terminal_color_6 = palette.blue
  vim.g.terminal_color_7 = palette.fg_dim
  vim.g.terminal_color_8 = palette.subtle
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.yellow
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.orange
  vim.g.terminal_color_14 = palette.blue
  vim.g.terminal_color_15 = palette.fg
end

return M
