# setting up PATH
CUSTOM_SCRIPTS_BASE=~/.dotfiles/scripts

EMACS_SCRIPTS=$CUSTOM_SCRIPTS_BASE/emacs
VIM_SCRIPTS=$CUSTOM_SCRIPTS_BASE/vim
ZSH_SCRIPTS=$CUSTOM_SCRIPTS_BASE/zsh
GIT_SCRIPTS=$CUSTOM_SCRIPTS_BASE/git
OSX_SCRIPTS=~/.options/osx/scripts

CUSTOM_SCRIPTS=$EMACS_SCRIPTS:$ZSH_SCRIPTS:$VIM_SCRIPTS:$OSX_SCRIPTS:$GIT_SCRIPTS

# homebrew: apple silicon lives in /opt/homebrew, intel in /usr/local
if [[ -d /opt/homebrew ]]; then
  HOMEBREW_PREFIX=/opt/homebrew
else
  HOMEBREW_PREFIX=/usr/local
fi
HOMEBREW_BIN=$HOMEBREW_PREFIX/bin
GNUBIN_PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
GNUMANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman

# sets HOMEBREW_* env vars. mountpath below owns PATH, so run this first.
[[ -x $HOMEBREW_BIN/brew ]] && eval "$($HOMEBREW_BIN/brew shellenv zsh)"

# Rust stuff
CARGO_BIN=~/.cargo/bin
RUST_SRC_PATH=~/code/sources/rust/src

# java stuff
if /usr/libexec/java_home -v1.8 &>/dev/null; then
  export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
  export JAVA_HOME=$JAVA_8_HOME
fi

mountpath () {
  PATH="/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"
  [[ -d "$HOMEBREW_BIN" ]] && PATH="$HOMEBREW_BIN:$PATH"
  PATH="$CUSTOM_SCRIPTS:$PATH"
  [[ -d "$GNUBIN_PATH" ]] && PATH="$GNUBIN_PATH:$PATH"
  # unguarded these prepend a bare "/bin" when the variable is empty
  [[ -n "$JAVA_HOME" ]] && PATH="$JAVA_HOME/bin:$PATH"
  [[ -d "$CARGO_BIN" ]] && PATH="$CARGO_BIN:$PATH"
  [[ -d "$RUST_SRC_PATH" ]] && PATH="$RUST_SRC_PATH:$PATH"
  [[ -d ~/.docker/bin ]] && PATH="$PATH:$HOME/.docker/bin"
  export PATH
}
mountpath

# manpath
[[ -d "$GNUMANPATH" ]] && export MANPATH="$GNUMANPATH:$MANPATH"

# node version manager
export NVM_DIR="$HOME/.nvm"
[[ -e $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh || true
