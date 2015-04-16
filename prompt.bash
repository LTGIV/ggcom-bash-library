#!/usr/bin/env bash
: <<'!COMMENT'

GGCOM - Bash - Library - Prompts v201504162001
Louis T. Getterman IV (@LTGIV)
www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/prompt

Example usage:
source "prompt.bash"
pauseret

Thanks:
http://www.cyberciti.biz/tips/linux-unix-pause-command.html

!COMMENT

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
	local numChar=${3-''}
	local timeout=${4-0}
	#-----/Variables

	if [[ "$numChar" =~ ^[0-9]+$ ]]; then
		read -n $numChar -p "$question [$defAnswer] : " inpAnswer
	else
		read -p "$question [$defAnswer] : " inpAnswer
	fi
	

	if [ -z "$inpAnswer" ]; then
		inpAnswer="$defAnswer"
	fi
	
	echo "$inpAnswer"

} # END FUNCTION: qa_with_def

function notifyalert() {

# Notification

	#----- Variables
	local	notifyapp="$1"
	local	notifyargs="$2"
	local	title="$3"
	local	message="$4"
	#-----/Variables

if [ ! -z "$notifyapp" ]; then
	eval $notifyapp "$( \
		str_replace "\%title\%" "$title" "$( \
		str_replace "\%message\%" "$message" "$notifyargs"
		)"
	)"
fi

} # END FUNCTION: notifyalert
