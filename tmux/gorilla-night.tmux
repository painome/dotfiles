# GORILLA NIGHT / tmux theme
# Black / Orange / Blue / Yellow — industrial, restrained UI
# The pane background is inherited from the terminal.

# Terminal color rendering
set -g default-terminal 'tmux-256color'
set -as terminal-features ',*:RGB'

# Status bar: compact segmented interface
set -g status on
set -g status-position bottom
set -g status-interval 5
set -g status-style 'fg=#E8E4DC,bg=#151515'
set -g status-justify left
set -g status-left-length 32
set -g status-right-length 48
set -g status-left '#[fg=#000000,bg=#4D9FFF,bold] TMUX #[fg=#4D9FFF,bg=#151515]#[fg=#FFB000,bg=#151515,bold] #S #[fg=#777777]│ '
set -g status-right '#[fg=#777777]│ #[fg=#FFB000,bold]%Y-%m-%d #[fg=#4D9FFF,bold]%H:%M #[fg=#000000,bg=#FF6600,bold] #{window_index}:#{pane_index} '

# Window tabs — only the active window is orange
set -g window-status-separator ' '
set -g window-status-format '#[fg=#A0A0A0,bg=#242424] #{window_index} #{window_name} '
set -g window-status-current-format '#[fg=#000000,bg=#FF6600,bold] #{window_index} #{window_name} '
set -g window-status-style 'fg=#A0A0A0,bg=#242424'
set -g window-status-current-style 'fg=#000000,bg=#FF6600,bold'
set -g window-status-activity-style 'fg=#FFB000,bg=#242424'
set -g window-status-bell-style 'fg=#FF7777,bg=#242424,bold'

# Pane frames: subtle idle, orange active
set -g pane-border-style 'fg=#343434'
set -g pane-active-border-style 'fg=#FF6600'
set -g pane-border-status off
set -g display-panes-colour '#4D9FFF'
set -g display-panes-active-colour '#FF6600'

# Selection, prompts and notifications
set -g mode-style 'fg=#000000,bg=#FFB000'
set -g copy-mode-selection-style 'fg=#000000,bg=#FFB000'
set -g message-style 'fg=#000000,bg=#FFB000'
set -g message-command-style 'fg=#000000,bg=#4D9FFF'

# Explicitly avoid overriding the shell/Neovim background color.
