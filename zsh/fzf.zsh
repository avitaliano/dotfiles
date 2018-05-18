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

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

# more exports
# ref: https://github.com/junegunn/fzf/issues/634#issuecomment-238036404
export FZF_DEFAULT_OPTS='--height 60% --reverse --border'
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/.ignore --follow -g "" 2>/dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
