# Adds the path to pkgsrc installed tools
if [ (uname) = "Darwin" ]
    set PATH /opt/pkg/bin /opt/pkg/sbin $PATH
end

# Opens all parameters
function x
    if test (count $argv) -eq 0
        x .
    else
        switch (uname)
        case Linux
            for i in $argv
                xdg-open $i 2> /dev/null
            end
        case Darwin
            for i in $argv
                open $i 2> /dev/null
            end
        end
    end
end

function g
    if test (count $argv) = 0
        git status
    else
        git $argv
    end
end

function c
    python3 -c "from math import *; print($argv)"
end

alias "l"="ls -lh"
alias vi=vim
alias df="df -h"
alias diff="colordiff -Naur"
alias mkdir="mkdir -pv"
alias make="make -j"
alias mosh='mosh --server="LC_CTYPE=en_US.UTF-8 LC_ALL=en_US.UTF-8 mosh-server"'

# Set ARM toolchain path
switch (uname)
    case Darwin
        set PATH ~/arm-gcc-toolchain/bin $PATH
    case Linux
        set PATH ~/sat/bin $PATH
end
