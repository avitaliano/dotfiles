# If .bash_profile exists, bash doesn't read .profile
if [[ -f ~/.profile  ]]; then
  . ~/.profile
fi

# If the shell is interactive and .bashrc exists, get the aliases and functions
if [[ $- == *i* && -f ~/.bashrc  ]]; then
  . ~/.bashrc
fi


# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"
