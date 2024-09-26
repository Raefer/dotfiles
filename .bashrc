# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
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


## CUSTOM

cat ~/concurrent-tasks

# shorthand
alias q=exit
alias pm=pulsemixer

# unix tool behavior
alias mkdir="mkdir -p -v"

# unix tool replacement
if [ -f $HOME/.cargo/bin/exa ]; then
	alias ls=exa
fi


