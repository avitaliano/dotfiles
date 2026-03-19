# This tmux statusbar config was created by tmuxline.vim
# on Mon, 24 Oct 2016
# Updated for tmux 3.2+ (replaced deprecated -fg/-bg/-attr with -style)

set -g status-bg "colour59"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"

set -g message-style "fg=colour117,bg=colour59"
set -g message-command-style "fg=colour117,bg=colour59"
set -g pane-active-border-style "fg=colour215"
set -g pane-border-style "fg=colour59"
set -g status-style "none"
set -g status-left-style "none"
set -g status-right-style "none"

setw -g window-status-style "fg=colour231,bg=colour59,none"
setw -g window-status-activity-style "fg=colour215,bg=colour59,none"
setw -g window-status-separator ""

set -g status-left "#[fg=colour17,bg=colour215] #S #[fg=colour215,bg=colour59,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour61,bg=colour59,nobold,nounderscore,noitalics]#[fg=colour231,bg=colour61] %Y-%m-%d | %H:%M #[fg=colour141,bg=colour61,nobold,nounderscore,noitalics]#[fg=colour17,bg=colour141] #h "
setw -g window-status-format "#[fg=colour231,bg=colour59] #I |#[fg=colour231,bg=colour59] #W "
setw -g window-status-current-format "#[fg=colour59,bg=colour59,nobold,nounderscore,noitalics]#[fg=colour117,bg=colour59] #I |#[fg=colour117,bg=colour59] #W #[fg=colour59,bg=colour59,nobold,nounderscore,noitalics]"
