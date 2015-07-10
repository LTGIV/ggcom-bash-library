#!/usr/bin/env bash
: <<'!COMMENT'

GGCOM - Bash - Library - File I/O v201507100702
Louis T. Getterman IV (@LTGIV)
www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/fileio

Example usage:
source "fileio.bash"
echo `real_dir "~/alias/"`

!COMMENT

# Required Support Programs
function support_prog() {
	# Given an array of programs, and if they're not there, will return failure, and pass a list of what failed.
	True
} # END FUNCTION: support_prog

# Current Directory
function curr_dir() {

	True
	
} # END FUNCTION: curr_dir

function real_dir() {

	if [ -d "$1" ]; then
		echo $( mod_trail_slash add "$( cd "$1" ; pwd -P )" )

	elif [ -f "$1" ]; then
		echo "$( cd "$(dirname "$1")" ; pwd -P )/`basename "$1"`"

	else
		echo ''

	fi

} # END FUNCTION: real_dir

function userHomePath() {

	#----- Variables
	local rawDestStr="$1"

	local user=''
	local host=''
	#-----/Variables

	# Invalid
	if [ -z `validateUserHost "$rawDestStr"` ]; then
		echo ''
		exit
	fi
	
	# Info
	user=`parseUserHost "$rawDestStr" user`
	host=`parseUserHost "$rawDestStr" host`

	if [ "$host" == 'localhost' ]; then
		echo -n "$(eval echo "~$user")"
	else
		echo -n "$(eval ssh "$user@$host" "'eval echo ~$user'")"
	fi

} # END FUNCTION: userHomePath

# Home Directory
# Optional argument is a specific user
# Over-glorified alias for userHomePath() - might chunk it in the future
function home_dir() {

	#----- Variables
	local userSelect=''
	[[ ! -z "$1" ]] && userSelect="$1" || userSelect=`whoami`
	#-----/Variables

	echo "`userHomePath "${userSelect}@localhost"`"

} # END FUNCTION: home_dir

function userDestPath() {

	#----- Variables
	local rawDestStr="$1"
	local home=`userHomePath "$rawDestStr"`

	local path=''
	
	local ret=''
	#-----/Variables

	# Invalid
	if [ -z "$home" ]; then ( echo -n ''; exit; ); fi

	path=`parseUserHost "$rawDestStr" path`

	[[ "${path:0:2}" == '~/' ]] && ret="${home}/${path:2}" || ret="$path"

	echo -n "$ret"

} # END FUNCTION: userDestPath
