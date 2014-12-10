export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git)
bindkey -v
bindkey "^R" history-incremental-search-backward
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
eval "$(rbenv init -)"

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux; fi
esac

export PATH="/Users/aleksander.sumowski/bin:/usr/local/opt/ruby/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/aleksander.sumowski/.rvm/bin:$PATH"

source $ZSH/oh-my-zsh.sh
export EDITOR='mvim'
source ~/.aliases
