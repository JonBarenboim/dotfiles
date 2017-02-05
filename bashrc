# Exit on non-interactive
if [ -z "$PS1" ] ; then
	return
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


########### ENVIRONMENT ##########
shopt -s nocaseglob histverify
export PATH=$HOME/bin/scripts:$PATH
export EDITOR=vim
export HISTSIZE=1000
export HISTIGNORE="history:cd *:ls *:pwd"
export HISTCONTROL="ignoredups"


######### ALIASES ##########
# Display directories in tree format
alias tree='find . -maxdepth 5 -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
# Display directories and files in tree format
alias treef='find . -maxdepth 3 | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
# Same tree functions as above but with no limit on depth
alias fulltree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias fulltreef='find . | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
# allow aliases to be expanded with sudo
alias sudo='sudo '
alias du="du -hs"
alias df="df -h"
alias where="which"
# print path with one item on each line
alias path='echo ${PATH//:/\\n}' 
alias stopwatch='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias piplocal="pip install --user"
alias type="type -a"


########## OTHER DOTFILES ##########
# Note: .functions must be sourced AFTER .lscolors so that aliases for ls can be expanded in functions
if [ -f .lscolors ] ; then
    . ./.lscolors
fi
if [ -f .functions ] ; then
    . ./.functions
fi
if [ -f .prompt ] ; then 
    . ./.prompt
fi
# Aliases and function specific to one machine. Keeps it from getting too cluttered
if [ -f .bashrc.local ] ; then
    . ./.bashrc.local
fi


