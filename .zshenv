# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# vim 設定
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export TERM=xterm-color

# node
export NODE_PATH=`npm root -g`

# rbenv
eval "$(rbenv init -)"
PATH=$PATH:/Users/kazukgw/.rbenv/shims

# ruby bundler
alias be="bundle exec"
alias be_ts="bundle exec time spring"
alias be_s="bundle exec spring"

# gem
export GEM_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'

# golang
export GOROOT=/usr/local/Cellar/go/1.4.2/libexec
export GOPATH=$HOME/CloudBackup/Projects
PATH=$PATH:$GOROOT:$GOPATH/bin

# alias
alias ls='ls -G'
alias t='tmux'
alias tat='tmux a -t'
alias g='git'
alias tig='tig --all'
alias rprod='RAILS_ENV=production'
alias rdev='RAILS_ENV=development'
alias rtest='RAILS_ENV=test'
alias ctags_rails='ctags --languages=ruby --exclude=".git*" --exclude="log" -R . $(bundle list --paths)'
alias notesync='sh ~/Projects/src/github.com/kazukgw/Note/sync.sh'

PATH=$PATH:/usr/bin:/usr/sbin/:/usr/local/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/X11/bin
PATH=$PATH:/System/Library/Frameworks
PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:$HOME/bin
export PATH

function prj() {
  local selected=$(ghq list | peco)
  if [ -n "$selected" ]; then
    cd ~/Projects/src/$selected
  else
    echo "$selected is not found..."
  fi
}
