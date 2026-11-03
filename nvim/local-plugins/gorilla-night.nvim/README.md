# GORILLA NIGHT v3

Standalone Neovim colorscheme. No TokyoNight dependency.

- Black / terminal-transparent background by default.
- Orange `#FF6600`, blue `#4D9FFF`, yellow `#FFB000` accents.
- Mint strings, lavender numbers, coral exceptions, cyan fields.
- Includes Neovim / Tree-sitter / LSP / nvim-tree / neo-tree / blink.cmp / render-markdown / indent-blankline highlight groups, plus lualine integration.

## Install (lazy.nvim)

Extract this folder to `~/.config/nvim/local-plugins/gorilla-night.nvim`.
Place this entry inside your existing `require("lazy").setup({ ... })` list (replace onedark):

```lua
{
  dir = vim.fn.stdpath("config") .. "/local-plugins/gorilla-night.nvim",
  name = "gorilla-night.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("gorilla-night")
  end,
},
```

Replace your lualine.nvim plugin specification with:

```lua
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = require("gorilla-night.lualine"),
},
```

The lualine integration keeps `buffers` on the left and `tabs` on the right. **Only selected buffer/tab is orange**; inactive entries are dark gray. The bottom statusline also uses Gorilla Night colors.

Do **not** use `theme = "auto"` here: use the provided `gorilla-night.lualine` options to set selected vs inactive component colors.

## Adjust colors

Edit `lua/gorilla-night/palette.lua`. Background transparency is controlled by `lua/gorilla-night/config.lua` (`transparent = true` by default). Restart Neovim after changes for a full refresh of both the colorscheme and lualine.

## Notes

This theme does not install nvim-tree, neo-tree, lualine or any other plugin: it only provides their appearance. Plugins may introduce highlight groups not covered yet.
