#!/usr/bin/env bash
: <<'!COMMENT'

GGCOM - Bash - Library - File I/O v201504162001
Louis T. Getterman IV (@LTGIV)
www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/fileio

Example usage:
source "fileio.bash"
echo `real_dir "~/alias/"`

!COMMENT

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
