ln -sf $GIT_ROOT/deps/vim/junegunn/fzf  $HOME/.fzf

# Provision a runnable, correct-arch fzf binary for THIS host.
# The binary is intentionally not vendored: upstream's .gitignore ignores
# bin/fzf and deps/ is git-ignored here, so nothing carries it between machines.
# Each host downloads its own via `install --bin`. This also self-heals a stray
# wrong-arch binary copied in from another platform (e.g. a macOS Mach-O binary
# on Linux -> "exec format error"), which the --version probe below detects.
if [[ ! -x $HOME/.fzf/bin/fzf ]] || ! $HOME/.fzf/bin/fzf --version >/dev/null 2>&1; then
  echo "fzf: (re)installing correct-arch binary for this host..."
  rm -f $HOME/.fzf/bin/fzf
  # Optional per-host proxy for the GitHub download, set in local (non-repo)
  # config. Scoped to this invocation so it can't affect other traffic.
  if [[ -n $FZF_INSTALL_PROXY ]]; then
    https_proxy=$FZF_INSTALL_PROXY http_proxy=$FZF_INSTALL_PROXY $HOME/.fzf/install --bin
  else
    $HOME/.fzf/install --bin
  fi
fi
