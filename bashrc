# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#-----------------------
# Greeting, motd etc...
#-----------------------

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
green='\e[0;32m'
orange='\e[0;32m'
NC='\e[0m' # No Color

PROMPTCOL=${blue}

# Only output text if the shell is interactive (otherwise scp and likewise will fail!)
if [ "$PS1" ]
then

	# Looks best on a black background...
	echo -e "${PROMPTCOL}This is BASH ${RED}${BASH_VERSION%.*}${PROMPTCOL} - DISPLAY on ${RED}$DISPLAY${NC}\n"
	date
	#fortune # makes our day a bit more fun.... :-)

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
PS1="\[${PROMPTCOL}\][\u@\h]\[$NC\] \w > "

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

unset LESSCHARSET
#--------------------------------------
# User environmental variables
#--------------------------------------

LESS=-asrRix8

EDITOR=nvim

export TERM=xterm-256color
