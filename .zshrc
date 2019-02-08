export ZSH=$HOME/.oh-my-zsh
setopt hist_ignore_all_dups hist_save_no_dups
ZSH_THEME="robbyrussell"
plugins=(git vi-mode aws brew last-working-dir kubectl terraform sbt docker)
# fasd, github, httpie, postgres, rails, rake, rand-quote, stack, sudo, systemd, terraform, tmux, tmuxinator, tmux-cssh, vim-interaction 

#we don't need terminals without tmux
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux -2; fi
esac


#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.paths
export EDITOR=`which nvim`
export BROWSER="firefox"
bindkey -v
export KEYTIMEOUT=1

eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -f ~/.profile ]
then
  source ~/.profile
fi

if [ -f ~/.trainlinerc ]
then
  source ~/.trainlinerc
fi

export PATH=/Users/asumowski/.local/bin:/Users/asumowski/bin:/Users/aleksanders/projects/t-automa/target/t-automa:Users/aleksanders/go/bin:/usr/local/Cellar/confluent-oss/5.1.0/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export HOMEBREW_GITHUB_API_TOKEN="13f5810c720b07b3022b50fbc4289dd8e485ec10"
autoload -Uz zmv

if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
    source "/usr/local/share/chtf/chtf.sh"
fi
chtf 0.11.11
export AWS_REGION=eu-west-1
