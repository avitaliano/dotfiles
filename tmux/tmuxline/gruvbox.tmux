# This tmux statusbar config was created by tmuxline.vim
# on Wed, 06 Jul 2016
# Updated for tmux 3.2+ (replaced deprecated -fg/-bg/-attr with -style)

set -g status-bg "colour237"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"

set -g message-style "fg=colour235,bg=colour243"
set -g message-command-style "fg=colour235,bg=colour243"
set -g pane-active-border-style "fg=colour208"
set -g pane-border-style "fg=colour243"
set -g status-style "none"
set -g status-left-style "none"
set -g status-right-style "none"

setw -g window-status-style "fg=colour246,bg=colour237,none"
setw -g window-status-activity-style "fg=colour208,bg=colour237,none"
setw -g window-status-separator ""

set -g status-left "#[fg=colour235,bg=colour208] #S #[fg=colour208,bg=colour237,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour243,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour243] %Y-%m-%d | %H:%M #[fg=colour208,bg=colour243,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour208] #h "
setw -g window-status-format "#[fg=colour246,bg=colour237] #I |#[fg=colour246,bg=colour237] #W "
setw -g window-status-current-format "#[fg=colour237,bg=colour243,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour243] #I |#[fg=colour235,bg=colour243] #W #[fg=colour243,bg=colour237,nobold,nounderscore,noitalics]"
