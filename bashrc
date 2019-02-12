# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#-----------------------
# Greeting, motd etc...
#-----------------------

# remove weird colors from ntfs-folders
eval "`dircolors ~/.mydircolors`"

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
green='\e[0;32m'
GREEN='\e[1;32m'
orange='\e[0;33m'
NC='\e[0m' # No Color

# If Cinnamon is booted make the prompt light green, otherwise nice and blue
if ps -e | grep -v grep | grep cinnamon > /dev/null
then
    PROMPTCOL=${GREEN}
else
    PROMPTCOL=${BLUE}
fi

## Make all output english
#export LANGUAGE=en

# Only output text if the shell is interactive (otherwise scp and likewise will fail!)
if [ "$PS1" ]
then
	date

	# function to run upon exit of shell
	function _exit()
	{
		echo -e "${RED}Goodbye!${NC}"
	}
	trap _exit EXIT

fi

#---------------
# Shell Prompt
#---------------

# --> Replace instances of \W with \w in prompt functions below
# --> to get display of full path name.
PS1="\[${PROMPTCOL}\][\u@\h]\[$NC\] \W > "

set -o vi
#--------------------------------------
# User specific aliases and functions
#--------------------------------------

# The 'ls' family (this assumes you use the GNU ls)
alias l='pwd; ls -lFh --color=auto'
alias ll='pwd; ls -alFh --color=auto'
alias lt='pwd; ls -lFtrh --color=auto'
alias tree='tree -C'
alias enw='emacs -nw'
alias tmux='tmux -2'
alias gst='git status'
#alias vim='nvim'
alias vimtex='vim --servername VIM'
alias editvim='vim ~/.vimrc'

unset LESSCHARSET
#--------------------------------------
# User environmental variables
#--------------------------------------

export LESS=-asrRix8
export EDITOR=vim
export SUDO_EDITOR=vim
#export TERM=xterm-256color
if [ -d "$HOME/.bin" ] ; then
  export PATH="$PATH:$HOME/.bin"
fi

# Uncomment if you want to stream audio to Nostromo
#export PULSE_SERVER="tcp:192.168.1.42"
