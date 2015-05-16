# Opens all parameters
function x

    if uname | grep "Darwin" then
        for i in $argv
            open $i 2> /dev/null
        end
    else
        for i in $argv
            open $i 2> /dev/null
        end
    end
end

alias "l"="ls -lh"
alias vi=nvim
alias vim=nvim
alias df="df -h"
alias diff="colordiff -Naur"
alias mkdir="mkdir -pv"
alias make="make -j6"

# Set chromium as the browser for the help
set -x BROWSER chromium

function fish_prompt
    printf '%s ' (date +%H:%M:%S)
    printf '%s%s%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)

    # Prints the git branch if we are in a git repository.
    printf " %s" (git branch 2> /dev/null | grep "*" | cut -f 2 -d " ")
    echo ' >'
end

# Shortcuts for hg and git

function g
    if test (count $argv) = 0
        git status
    else
        git $argv
    end
end

function opcode
    echo $argv > _tmp.S
    nasm _tmp.S -o _tmp.o
    ndisasm _tmp.o
    rm -rf _tmp.{S,o}
end


# github go
function ghg;
    ~/dotfiles/ghg.py $argv
end;

set PATH ~/arm-gcc-toolchain/bin $PATH
set -x TERM xterm-256color


# If we dont put this, there is a bug in fish which causes infinite loop when there is only
# a single dot


