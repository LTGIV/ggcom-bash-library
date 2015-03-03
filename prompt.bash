#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Prompts v201503031019
# Louis T. Getterman IV (@LTGIV)
# www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/prompt
#
# Example usage:
# source "prompt.bash"
# pauseret

# http://www.cyberciti.biz/tips/linux-unix-pause-command.html

function pause(){
	read -p "$*";
} # END FUNCTION

function pauseret() {
	pause 'Press [Enter] key to continue...';
} # END FUNCTION
