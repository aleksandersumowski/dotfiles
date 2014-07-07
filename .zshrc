ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
setopt hist_ignore_all_dups hist_save_no_dups
plugins=(git)

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux; fi
esac

source ~/.aliases
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:/usr/local/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting
source $ZSH/oh-my-zsh.sh
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
bindkey -v

bindkey "^R" history-incremental-search-backward

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="~/.rbenv/bin:/usr/local/opt/ruby/bin:/usr/local/heroku/bin:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
