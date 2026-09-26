# deploy symlinks

cd $GIT_ROOT
for file in ./**/deploy.zsh; do
  source $file
done

verifylink ~/.dotfiles
updatelinks ~/.dotfiles .

# git refuses to operate on a repo owned by another user (e.g. a shared checkout).
# register this one once; --add would append a duplicate on every run.
if ! git config --global --get-all safe.directory 2>/dev/null | grep -qxF "$GIT_ROOT"; then
  git config --global --add safe.directory "$GIT_ROOT"
fi
