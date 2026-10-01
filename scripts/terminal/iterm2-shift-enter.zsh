#!/bin/zsh
# Make Shift+Enter insert a newline in Claude Code (and other TUIs) under iTerm2 + tmux.
#
# Symptom: Shift+Enter submits the prompt instead of adding a new line.
# Cause:   tmux drops the Shift modifier, so the app only sees Enter.
# Fix:     map Shift+Enter in iTerm2's default profile to "Send Text: \n" (Ctrl+J),
#          which passes through tmux unchanged. tmux extended-keys does NOT fix it.
#
# Restart iTerm2 (Cmd+Q) after running. Re-run if iTerm2 ever resets its prefs.

set -euo pipefail

domain=com.googlecode.iterm2
plistbuddy=/usr/libexec/PlistBuddy
work=$(mktemp -d)
prefs=$work/iterm2.plist

defaults export $domain $prefs
cp $prefs ~/.iterm2-prefs.backup.plist

# Find the index of the default profile.
default_guid=$($plistbuddy -c "Print ':Default Bookmark Guid'" $prefs)
index=0
while guid=$($plistbuddy -c "Print ':New Bookmarks:${index}:Guid'" $prefs 2>/dev/null); do
  [[ $guid == $default_guid ]] && break
  index=$((index + 1))
done

# Older iTerm2 uses 0xd-0x20000, newer appends the keycode (0x24).
for key in 0xd-0x20000 0xd-0x20000-0x24; do
  entry=":New Bookmarks:${index}:Keyboard Map:${key}"
  $plistbuddy -c "Delete '${entry}'" $prefs 2>/dev/null || true
  $plistbuddy \
    -c "Add '${entry}' dict" \
    -c "Add '${entry}:Action' integer 12" \
    -c "Add '${entry}:Text' string '\n'" \
    -c "Add '${entry}:Version' integer 1" \
    $prefs
done

defaults import $domain $prefs
rm -rf $work
print -r -- "Shift+Enter -> \\n mapped in iTerm2 default profile. Backup: ~/.iterm2-prefs.backup.plist"
echo "Restart iTerm2 (Cmd+Q) to apply."
