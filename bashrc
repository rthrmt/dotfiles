# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#-------------------------------------------------------------
# Automatic setting of $DISPLAY (if not set already)
# This works for linux - your mileage may vary.... 
# The problem is that different types of terminals give
# different answers to 'who am i'......
# I have not found a 'universal' method yet
#-------------------------------------------------------------

function get_xserver ()
{
	case $TERM in
	xterm )
		XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
		XSERVER=${XSERVER%%:*}
		;;
	aterm | rxvt)
		# find some code that works here...
		;;
	esac
}

if [ -z ${DISPLAY:=""} ]; then
	get_xserver
	if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || ${XSERVER} == "unix" ]]; then
		# Display on local host
		DISPLAY=":0.0"
	else
		# Display on remote host
		DISPLAY=${XSERVER}:0.0
	fi
fi

export DISPLAY

#---------------
# Some settings
#---------------

# No coredumps
ulimit -S -c 0

# Disable options:
shopt -u mailwarn
unset MAILCHECK

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts # Put a list of remote hosts in ~/.hosts

# Bash history control
export HISTIGNORE="&:bg:fg:ll:l:ls"
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

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
NC='\e[0m' # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.

# Only output text if the shell is interactive (otherwise scp and likewise will fail!)
if [ "$PS1" ]
then
	
	# Looks best on a black background...
	echo -e "${cyan}This is BASH ${RED}${BASH_VERSION%.*}${cyan} - DISPLAY on ${RED}$DISPLAY${NC}\n"
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

# local machine: prompt will be partly cyan
HILIT=${cyan}

# --> Replace instances of \W with \w in prompt functions below
# --> to get display of full path name.
PS1="\[${HILIT}\][\h]\[$NC\] \w > "

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

# tailoring 'less'
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # Use this if lesspipe.sh exists
export LESS='-x3 -i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

#--------------------------------------
# User environmental variables
#--------------------------------------

EDITOR=vim

