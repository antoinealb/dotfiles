# Opens all parameters
function x
    for i in $argv
        xdg-open $i 2> /dev/null 
    end
end

alias "l"="ls -lh"
alias vi=vim
alias df="df -h"
alias diff="colordiff -Naur"
alias mkdir="mkdir --parents --verbose"
alias make="make -j6"

# Set chromium as the browser for the help
set -x BROWSER chromium

function fish_prompt
    printf '%s ' (date +%H:%M:%S)
    printf '%s%s%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) 

    # Prints mercurial current branch if we are in a repository.
    printf " %s" (hg branch 2> /dev/null) 

    # Prints the git branch if we are in a git repository.
    printf " %s" (git branch 2> /dev/null | grep "*" | cut --fields=2 --delimiter=" ") 
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

function h
    if test (count $argv) = 0
        hg status 
    else
       hg $argv 
    end
end

function card
    tutor card $argv --format json | python2 -mjson.tool
end

set -X WORKON_HOME=~/.virtualenvs
set -X PROJECT_HOME=~/code/web/mtg_inventory/
sh /usr/local/bin/virtualenvwrapper.sh

# github go

function ghg;
    xdg-open "https://github.com/$argv"
end;

set PATH /opt/microchip/xc16/v1.21/bin/ $PATH
set PATH ~/sat/bin $PATH
set -x TERM xterm-256color

# Dossier sur lesquels je bosse en ce moment
alias jj='cd ~/Documents/EPFL/Bachelor56/conception_produit'
alias optic='cd ~/Documents/EPFL/Bachelor56/TPOptique/TP'


# If we dont put this, there is a bug in fish which causes infinite loop when there is only
# a single dot


