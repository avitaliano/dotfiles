# This tmux statusbar config was created by tmuxline.vim
# on Tue, 01 Nov 2016
# Updated for tmux 3.2+ (replaced deprecated -fg/-bg/-attr with -style)

set -g status-bg "colour238"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"

set -g message-style "fg=colour251,bg=colour239"
set -g message-command-style "fg=colour251,bg=colour239"
set -g pane-active-border-style "fg=colour114"
set -g pane-border-style "fg=colour239"
set -g status-style "none"
set -g status-left-style "none"
set -g status-right-style "none"

setw -g window-status-style "fg=colour246,bg=colour238,none"
setw -g window-status-activity-style "fg=colour114,bg=colour238,none"
setw -g window-status-separator ""

set -g status-left "#[fg=colour236,bg=colour114] #S #[fg=colour114,bg=colour238,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour239,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour248,bg=colour239] %Y-%m-%d | %H:%M #[fg=colour246,bg=colour239,nobold,nounderscore,noitalics]#[fg=colour238,bg=colour246] #h "
setw -g window-status-format "#[fg=colour246,bg=colour238] #I |#[fg=colour246,bg=colour238] #W "
setw -g window-status-current-format "#[fg=colour238,bg=colour239,nobold,nounderscore,noitalics]#[fg=colour251,bg=colour239] #I |#[fg=colour251,bg=colour239] #W #[fg=colour239,bg=colour238,nobold,nounderscore,noitalics]"
