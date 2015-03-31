#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Prompts v201503311320
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

function qa_with_def() {

	#----- Variables
	local question="$1"
	local defAnswer="$2"
	local inpAnswer=''
	#-----/Variables

	read -p "$question [$defAnswer] : " inpAnswer
	if [ -z "$inpAnswer" ]; then
		inpAnswer="$defAnswer"
	fi
	
	echo "$inpAnswer"

} # END FUNCTION: qa_with_def
