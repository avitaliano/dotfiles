# guard against old images
if [[ ! -d $HOME/.fzf ]]; then
  print "O fzf não está instalado."
  return
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Completion + key bindings
# --------------------------
# Prefer the integration emitted by the fzf binary that's actually on PATH, so
# the shell scripts always match the running version. The vendored ~/.fzf clone
# can drift ahead of the system binary and emit flags it can't parse (e.g.
# `--min-height 20+` on fzf < 0.60 -> "$FZF_DEFAULT_OPTS: height required: HEIGHT",
# breaking CTRL-R). Fall back to the vendored scripts on older fzf.
if (( $+commands[fzf] )) && command fzf --zsh >/dev/null 2>&1; then
  source <(command fzf --zsh)
else
  [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
  source "$HOME/.fzf/shell/key-bindings.zsh"
fi

# more exports
# ref: https://github.com/junegunn/fzf/issues/634#issuecomment-238036404
export FZF_DEFAULT_OPTS='--height 60% --reverse --border'
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/.ignore --follow -g "" 2>/dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
