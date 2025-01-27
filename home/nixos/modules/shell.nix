{ config, pkgs, lib, ... }:
{
    programs.bash = {
        promptInit = ''
        # Provide a nice prompt if the terminal supports it.
        if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
            PROMPT_COLOR="1;31m"
            ((UID)) && PROMPT_COLOR="1;32m"
            if [ -n "$INSIDE_EMACS" ]; then
                # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
                PS1="\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
            else
                PS1="\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
            fi
            if test "$TERM" = "xterm"; then
                PS1="\[\033]2;\h:\u:\w\007\]$PS1"
            fi
        fi
        '';

        shellAliases = {
            # Shorthand
            q = "exit";
            sdn = "shutdown now";
            # Behavior
            grep = "grep --color=always";
            ip = "ip --color";
            # Unix tool replacement
            ls = "eza --color=always --header --group";
            cat = "bat --style=plain --paging=never";
        };

        shellInit = ''
        if [[ -d $HOME/Downloads ]]; then
            rmdir Downloads
        fi

        if ! [[ "$PATH" =~ "$HOME/script" ]]; then
            PATH="$HOME/script:$PATH"
        fi
        export PATH
        '';
    };
}
