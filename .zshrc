export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git vi-mode aws brew last-working-dir kubectl)

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
export PATH="/Users/aleksander.sumowski/.rvm/gems/ruby-2.3.1/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/.rvm/bin:$HOME/libs/bin:/usr/local/sbin:$GOPATH/bin/:$HOME/tools/google-cloud-sdk/bin/"


source /Users/aleksander.sumowski/.rvm/scripts/rvm
# The next line enables shell command completion for gcloud.
if [ -f /Users/aleksander.sumowski/tools/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/aleksander.sumowski/tools/google-cloud-sdk/completion.zsh.inc'
fi



eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# Source chtf
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
    source "/usr/local/share/chtf/chtf.sh"
fi

chtf 0.10.6

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ki() {
  kubectl $@ --namespace=insurance
}

