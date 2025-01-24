# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc

. "$HOME/.cargo/env"

# fctix5
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

## CUSTOM

# add ~/script/ to $PATH
if ! [[ "$PATH" =~ "$HOME/script/sway:$HOME/script" ]]; then
    PATH="$HOME/script/sway:$HOME/script:$PATH"
fi
export PATH

# shorthand
alias pm="pulsemixer"
alias q="exit"
alias sdn="shutdown now"

# navigation shorthand
alias dotfiles="cd  ~/downloads/git/dotfiles/"

# unix tool behavior
alias grep="grep --color=always"
alias ip="ip --color"
alias ls="ls --color=auto --group-directories-first --human-readable"
alias mkdir="mkdir --parents"
alias neofetch="hyfetch"

# unix tool replacement (rust)
if [ -f $HOME/.cargo/bin/exa ]; then
    alias ls="exa --color=always --header --group"
fi

if [ -f $HOME/.cargo/bin/bat ]; then
    alias cat="bat --style=plain --paging=never"
fi

if [ -f $HOME/.cargo/bin/dust ]; then
    alias du="dust"
fi

# DELETING SHIT

# why capitalize? just... why?
if [ -d $HOME/Downloads ]; then
    rmdir Downloads
fi

if [ -f $HOME/.local/share/recently-used.xbel ]; then
    rm $HOME/.local/share/recently-used.xbel
fi