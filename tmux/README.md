# GORILLA NIGHT for tmux

A standalone tmux theme matching the GORILLA NIGHT Neovim palette.

## Install

Copy `gorilla-night.tmux` to `~/.config/tmux/gorilla-night.tmux`.
Add the following line to the **end** of your tmux configuration (`~/.tmux.conf` or `~/.config/tmux/tmux.conf`):

```tmux
source-file ~/.config/tmux/gorilla-night.tmux
```

Reload from the shell:

```sh
tmux source-file ~/.tmux.conf
```

Or, if using the XDG path: `tmux source-file ~/.config/tmux/tmux.conf`.

## Appearance

- Gray inactive windows / orange selected window
- Blue session badge, amber date, blue clock
- Active pane frame in orange, inactive frame gray
- Amber copy-mode selection
- Terminal background left untouched

Uses a Powerline arrow (``) in the left session segment. Replace that character with `│` if the font lacks Powerline symbols.

The file changes only tmux appearance and terminal color support; it does not remap shortcuts.
