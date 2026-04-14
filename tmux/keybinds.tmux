# -*- mode: sh -*-

# vi mode settings
# Note: if you have EDITOR=vim set
# then the following two settings aren't needed
# Use Vi style key bindings to move around command line mode
set-option -g status-keys vi
# Use Vi style key bindings to move around copy mode
setw -g mode-keys vi
# Remove delay when pressing esc in Vim
set -sg escape-time 0

unbind C-b
set -g prefix C-Space

# Quick key for moving back to the previous window
bind-key p last-window

bind Space copy-mode
bind r source ~/.tmux.conf \; display "Config reloaded"
bind b previous-window

# splits: h = horizontal (side-by-side), v = vertical (top/bottom)
bind-key h split-window -h
bind-key v split-window -v

# restore kill-pane (default prefix x)
bind-key x confirm-before -p "kill-pane #P? (y/n)" kill-pane

# moving panes
bind-key g command-prompt -p "join pane from:"  "join-pane -s '%%'"
bind-key s command-prompt -p "send pane to:"  "join-pane -t '%%'"

# Make resizing panes easier
bind-key < resize-pane -L 5
bind-key > resize-pane -R 5
bind-key Up resize-pane -U 5
bind-key Down resize-pane -D 5
bind-key = select-layout even-vertical
bind-key | select-layout even-horizontal

# ditched m which had select-pane -m
# re-bound to mark pane (useful for swap-pane)
bind-key m select-pane -m


#### directly bind function keys
# fast window selection
bind -n F1 select-window -t 1
bind -n F2 select-window -t 2
bind -n F3 select-window -t 3
bind -n F4 select-window -t 4
bind -n F5 select-window -t 5
bind -n F6 new-window

# renames tmux window
# more info here: http://unix.stackexchange.com/a/269542/155613
bind -n F7 command-prompt "rename-window '%%'"

# reload tmux config
bind -n F8 source ~/.tmux.conf

# rotate through different pre set layouts
bind -n F9 next-layout

# rotate through different pre set layouts
bind -n F10 copy-mode

# F11 unbound (mouse is always on, see options.tmux)

# toggles tmux bar on/off
bind-key -n F12 set status

# switch panes using <M-arrow> without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

