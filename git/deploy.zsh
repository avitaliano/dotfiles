# The tracked config is linked, never copied over ~/.gitconfig: that file holds
# machine-local sections ([user], credentials, safe.directory) that must survive install.
verifylink ~/.gitconfig.dotfiles
updatelinks ~/.gitconfig.dotfiles git/gitconfig

if [[ ! -e ~/.gitconfig ]]; then
  echo "creating ~/.gitconfig including the tracked config"
  cat > ~/.gitconfig <<'STUB'
[include]
	path = ~/.gitconfig.dotfiles
STUB
elif ! git config --global --get-all include.path 2>/dev/null | grep -qx '~/.gitconfig.dotfiles'; then
  echo "adding ~/.gitconfig.dotfiles include to ~/.gitconfig"
  git config --global --add include.path '~/.gitconfig.dotfiles'
fi

# credential storage is platform specific: never fall back to the plaintext `store` helper.
# unset first, a plain --global set refuses to collapse pre-existing multiple values.
git config --global --unset-all credential.helper 2>/dev/null
if [[ "$(uname)" == "Darwin" ]]; then
  git config --global credential.helper osxkeychain
else
  git config --global credential.helper 'cache --timeout=3600'
fi
