# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme coffeeandcode

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins themes

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
#
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

function g
    if test (count $argv) = 0
        git status
    else
        git $argv
    end
end

# github go
function ghg;
    ~/dotfiles/ghg.py $argv
end;

alias "l"="ls -lh"
alias vi=nvim
alias vim=nvim
alias df="df -h"
alias diff="colordiff -Naur"
alias mkdir="mkdir -pv"
alias make="make -j6"
alias mosh='mosh --server="LC_CTYPE=en_US.UTF-8 LC_ALL=en_US.UTF-8 mosh-server"'

set PATH ~/arm-gcc-toolchain/bin $PATH
# Path to GNU utils
if uname | grep 'Darwin' > /dev/null
    set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end
