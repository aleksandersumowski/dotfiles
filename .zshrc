export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git vi-mode aws brew last-working-dir kubectl)
# fasd, github, httpie, postgres, rails, rake, rand-quote, stack, sudo, systemd, terraform, tmux, tmuxinator, tmux-cssh, vim-interaction 

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux -2; fi
esac


#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.paths
export EDITOR="vim"
export BROWSER="firefox"
bindkey -v
export KEYTIMEOUT=1

eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Youview dev env setup
if [ -f ~/.youviewrc ]
then
  source ~/.youviewrc
fi
