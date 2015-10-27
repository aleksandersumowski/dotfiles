export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git vim-mode autojump aws brew capistrano last-working-dir vundle fabric)

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux -2; fi
esac


#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
source $ZSH/oh-my-zsh.sh
source ~/.aliases
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/libs/bin"
export EDITOR="vim"
bindkey -v
export KEYTIMEOUT=1
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:/Library/Python/2.7/site-packages:$PYTHONPATH
export GOPATH=/Users/aleksander.sumowski/libs/:/Users/aleksander.sumowski/projects/
bindkey "^R" history-incremental-search-backward
source ~/.aws_credentials

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"
