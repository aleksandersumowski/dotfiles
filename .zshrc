export ZSH=$HOME/.oh-my-zsh

setopt hist_ignore_all_dups hist_save_no_dups notify
unsetopt beep
ZSH_THEME="robbyrussell"
plugins=(
git aws brew last-working-dir terraform sbt docker fasd fzf kubectl
# vi-mode
zsh-vi-mode
)
# extra config
source $ZSH/oh-my-zsh.sh


export EDITOR="/usr/local/bin/nvim"
export BROWSER="firefox"
export TMUX_PLUGIN_MANAGER_HOME="${HOME}/.tmux/plugins/tpm"
export KEYTIMEOUT=1
export AWS_REGION=eu-west-1
export LANG="en_US.UTF-8"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export ZVM_VI_SURROUND_BINDKEY=s-prefix

##we don't need terminals without tmux
alias tmux="env TERM=xterm-256color tmux"
case $- in *i*)
      if [ -z "$TMUX" ]; then exec tmux -2 new-session -A -s main; fi
esac
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

eval "$(pyenv init --path)"


function is_osx() {
    local platform=$(uname)
    [ "$platform" == "Darwin" ]
}

function source_if_exists {
    test -e $1 &&  source $1 || print  $1 " not found"
}


##autoload -Uz zmv ## zmv - mass move tool, supports wildcards/patters/etc
autoload -Uz compinit
compinit

alias luamake=/Users/aleksandersumowski/tools/lua-language-server/3rd/luamake/luamake
source_if_exists "${HOME}/.aliases"
source_if_exists "${HOME}/.paths"
source_if_exists "${HOME}/.sdkman/bin/sdkman-init.sh"

bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^?' backward-delete-char
