ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
setopt hist_ignore_all_dups hist_save_no_dups
plugins=(git)

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux; fi
esac

source $ZSH/oh-my-zsh.sh
source ~/.aliases
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:~/bin:/usr/local/bin
