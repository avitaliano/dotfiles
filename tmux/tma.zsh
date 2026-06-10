# tma: fzf-based tmux session picker (zsh function, sourced from zsh/functions.zsh)
# Lists tmux sessions, picks one via fzf (with a window-list preview), then
# switches (if already inside tmux) or attaches. No sessions -> start a new one.

tma() {
  local sessions session
  sessions=$(tmux list-sessions -F '#{session_name}' 2>/dev/null)
  if [[ -z "$sessions" ]]; then
    tmux new-session
    return
  fi
  session=$(echo "$sessions" | fzf \
    --height=40% --reverse --no-multi \
    --prompt='tmux> ' \
    --preview='tmux list-windows -t {} -F "#{window_index}: #{window_name}"' \
    --preview-window=right:40%) || return
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$session"
  else
    tmux attach-session -t "$session"
  fi
}
