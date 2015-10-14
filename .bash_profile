sh ~/.rc_osx_default

source ~/.bash_prompt
source ~/.rc_functions
source ~/.rc_aliases
source ~/.rc_rbenv
source ~/.rc_go
source ~/.rc_homebrew

export GEM_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
export TERM=xterm-color

PATH=$PATH:/usr/bin:/usr/sbin/:/usr/local/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/X11/bin
PATH=$PATH:/System/Library/Frameworks
PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
PATH=$PATH:$HOME/bin
export PATH

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion"  ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion  ]; then
  source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash  ]; then
    complete -o default -o nospace -F _git g;
  fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config"  ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
