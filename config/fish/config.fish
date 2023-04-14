set PATH $HOME/.cargo/bin /usr/local/bin /usr/sbin /opt/homebrew/bin/ $PATH
if status is-interactive
        set -gx EDITOR vim
        fish_config theme choose nord
        /opt/homebrew/bin/zoxide init fish | source
end

starship init fish | source
