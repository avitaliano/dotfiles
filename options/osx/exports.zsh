# setting up PATH
CUSTOM_SCRIPTS_BASE=~/.dotfiles/scripts

EMACS_SCRIPTS=$CUSTOM_SCRIPTS_BASE/emacs
VIM_SCRIPTS=$CUSTOM_SCRIPTS_BASE/vim
ZSH_SCRIPTS=$CUSTOM_SCRIPTS_BASE/zsh
GIT_SCRIPTS=$CUSTOM_SCRIPTS_BASE/git
OSX_SCRIPTS=~/.options/osx/scripts

CUSTOM_SCRIPTS=$EMACS_SCRIPTS:$ZSH_SCRIPTS:$VIM_SCRIPTS:$OSX_SCRIPTS:$GIT_SCRIPTS
if [[ -d /opt/homebrew ]]; then
  HOMEBREW_BIN=/opt/homebrew/bin
  GNUBIN_PATH=/opt/homebrew/opt/coreutils/libexec/gnubin
else
  HOMEBREW_BIN=
  GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
fi

# Rust stuff
CARGO_BIN=~/.cargo/bin
RUST_SRC_PATH=~/code/sources/rust/src

# java stuff
if /usr/libexec/java_home -v1.8 &>/dev/null; then
  export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
  alias java7='export JAVA_HOME=$JAVA_7_HOME && mountpath'
  export JAVA_HOME=$JAVA_8_HOME
fi

mountpath () {
  PATH="/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"
  [[ -d "$HOMEBREW_BIN" ]] && PATH="$HOMEBREW_BIN:$PATH"
  PATH="$CUSTOM_SCRIPTS:$PATH"
  PATH="$GNUBIN_PATH:$PATH"
  PATH="$JAVA_HOME/bin:$PATH"
  PATH="$CARGO_BIN:$PATH"
  PATH="$RUST_SRC_PATH:$PATH"
  export PATH
}
mountpath

# manpath
if [[ -d /opt/homebrew ]]; then
  GNUMANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman"
else
  GNUMANPATH="/usr/local/opt/coreutils/libexec/gnuman"
fi
MANPATH="$GNUMANPATH:$MANPATH"
export MANPATH

# node version manager

export NVM_DIR="$HOME/.nvm"
[[ -e $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh || true
