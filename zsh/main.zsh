# -*- mode: sh -*-

# bail out if not running in zsh
[[ -z "$ZSH_VERSION" ]] && return 0

source ~/.zsh.d/constants.zsh
source ~/.zsh.d/envbootstrap.zsh
source ~/.zsh.d/options.zsh
source ~/.zsh.d/termcolors.zsh
source ~/.zsh.d/fixescapecodes.zsh

source ~/.zsh.d/zleconfig.zsh
source ~/.zsh.d/functions.zsh
source ~/.zsh.d/dir_tracker.zsh

source ~/.zsh.d/alias.zsh
source ~/.zsh.d/alias-git.zsh
source ~/.zsh.d/alias-dir.zsh
source ~/.zsh.d/alias-docker.zsh
#source ~/.zsh.d/alias-emacs.zsh
source ~/.zsh.d/alias-vim.zsh

source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/ninplug.zsh

# load step
load_plugins

# init completion system
source ~/.zsh.d/completions.zsh

# colors for GNU ls (from coreutils)
(( $+commands[dircolors] )) && eval $(dircolors ~/.lscolors)

# bootstrat fzf
source ~/.zsh.d/fzf.zsh
source ~/.zsh.d/zshenv.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || true

git config --global --add safe.directory /opt/dotfiles
# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/service/.docker/bin"
# End of Docker Desktop section.

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"
