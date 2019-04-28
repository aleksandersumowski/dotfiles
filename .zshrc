export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git vi-mode aws brew last-working-dir kubectl terraform sbt docker fasd)

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux -2; fi
esac

# extra config
source $ZSH/oh-my-zsh.sh


source ~/.aliases
source ~/.paths
if [ -f ~/.profile ]
then
  source ~/.profile
fi
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source "$HOME/.sdkman/bin/sdkman-init.sh"
source "$HOME/.uswitch"


source ~/.fzf.zsh



export HOMEBREW_GITHUB_API_TOKEN=1144893beaa0aecf09e4b26986c0597f2f22a508
export EDITOR=`which nvim`
export BROWSER="firefox"
bindkey -v
export KEYTIMEOUT=1



eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
autoload -Uz zmv

export AWS_REGION=eu-west-1
