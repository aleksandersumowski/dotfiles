# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '
#
# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile
#
# setopt XTRACE

source "${HOME}/.aliases"
source "${HOME}/.paths"
# source "${HOME}/.sdkman/bin/sdkman-init.sh"
export ZSH=$HOME/.oh-my-zsh
#
setopt hist_ignore_all_dups hist_save_no_dups notify
unsetopt beep
ZSH_THEME="robbyrussell"
plugins=(
fzf
git
kubectl
zoxide
zsh-vi-mode
# brew
# last-working-dir
# docker
# helm
# terraform
# vi-mode
)
# extra config
source $ZSH/oh-my-zsh.sh

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY
export EDITOR="/usr/local/bin/nvim"
export BROWSER="firefox"
export TMUX_PLUGIN_MANAGER_HOME="${HOME}/.tmux/plugins/tpm"
export KEYTIMEOUT=1
export AWS_REGION=eu-west-1
export LANG="en_US.UTF-8"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export ZVM_VI_SURROUND_BINDKEY=s-prefix
export ZVM_VI_EDITOR=$EDITOR
#
# ##we don't need terminals without tmux
# # alias tmux="env TERM=xterm-256color tmux"
# # case $- in *i*)
# #       if [ -z "$TMUX" ]; then exec tmux -2 new-session -A -s main; fi
# # esac
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

##autoload -Uz zmv ## zmv - mass move tool, supports wildcards/patters/etc
# autoload -Uz compinit
# compinit

alias luamake=/Users/aleksandersumowski/tools/lua-language-server/3rd/luamake/luamake

bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^?' backward-delete-char
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# unsetopt XTRACE
# exec 2>&3 3>&-
