export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git vim-mode aws brew capistrano last-working-dir fabric)

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux -2; fi
esac


#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
source $ZSH/oh-my-zsh.sh
source ~/.aliases
export EDITOR="vim"
export BROWSER="firefox"
bindkey -v
export KEYTIMEOUT=1
export GOPATH=/Users/aleksander.sumowski/projects/gopath/
source ~/.aws_credentials
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/.rvm/bin:$HOME/libs/bin:/usr/local/sbin:$GOPATH/bin/:$HOME/tools/google-cloud-sdk/bin/"

export COMMS_WEB_HOME=/Users/aleksander.sumowski/projects/comms-web
source /Users/aleksander.sumowski/.rvm/scripts/rvm
# The next line enables shell command completion for gcloud.
if [ -f /Users/aleksander.sumowski/tools/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/aleksander.sumowski/tools/google-cloud-sdk/completion.zsh.inc'
fi



eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
