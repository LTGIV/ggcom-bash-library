#!/usr/bin/env bash
: <<'!COMMENT'

GGCOM - Bash - Library - Strings v201504020726
Louis T. Getterman IV (@LTGIV)
www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/string

Example usage:
source "string.bash"
echo `str_repeat - 80`

Thanks:
http://www.linuxjournal.com/content/return-values-bash-functions
http://stackoverflow.com/questions/5349718/how-can-i-repeat-a-character-in-bash
http://forums.gentoo.org/viewtopic-t-660965-view-previous.html
http://stackoverflow.com/questions/13210880/replace-one-substring-for-another-string-in-shell-script

To-do:
* Add count into str_replace

!COMMENT

# echo `str_repeat - 80`
function str_repeat()
{
    local  char=$1
    local  repeat=$2

    local  stat="`seq -s${char} ${repeat} | tr -d '[:digit:]'`"

    echo $stat
} # END FUNCTION: str_repeat

function str_replace()
{
	#----- Variables
	local	search="$1"
	local	replace="$2"
	local	subject="$3"
	local	count='' # use / to replace one or // to replace all
	#----- Variables

	echo "${subject//$search/$replace}"

} # END FUNCTION: str_replace

function parseUserHost() {

	#----- Variables
	local	raw=$1
	local	choice=$2

	local	user="${raw%@*}"		# BEFORE @
	local	rawhost="${raw#*@}"		# AFTER  @
	local	host="${rawhost%:*}"	# BEFORE :
	local	path="${rawhost#*:}"	# AFTER  :
	#-----/Variables

	case $choice in
		user)
			ret=$user
			;;

		host)
			ret=$host
			;;

		path)
			if [ "$path" != "$host" ]; then
				ret=$path
			else
				ret=''
			fi
			;;

		*)
			ret=$raw
			;;
	esac

	echo "$ret"

} # END FUNCTION: parseUserHost

function validateUserHost() {

	#----- Variables
	local qstnDestStrTest="$1"
	#-----/Variables

	# Attempt to parse variables from argument
	if [ ! -z "$qstnDestStrTest" ]; then

		ansrUser=`parseUserHost "$qstnDestStrTest" user`
		ansrSrvr=`parseUserHost "$qstnDestStrTest" host`
		ansrDest=`parseUserHost "$qstnDestStrTest" path`
	
		# Implicit localhost, trigger localhost and user test below
		if [ "$ansrSrvr" == 'localhost' ]; then ansrSrvr="$ansrUser"; fi

		# validUser@localhost
		if [ "$ansrUser" == "$ansrSrvr" ] && [ "$(eval echo "~$ansrUser")" != "~${ansrUser}" ]; then
			ansrSrvr="localhost"

		# invalidUser@localhost
		elif [ "$ansrUser" == "$ansrSrvr" ]; then
			ansrUser=''
	
		fi
	
	fi # END

	# Build output value
	if [ ! -z "$ansrUser" ]; then

		# user@host
		qstnDestStrTest="${ansrUser}@${ansrSrvr}"

		# Add destination
		if [ ! -z "$ansrDest" ]; then
			qstnDestStrTest="${qstnDestStrTest}:`mod_trail_slash add "$ansrDest"`"
		fi

	# Invalid
	else

		qstnDestStrTest=''

	fi

	# Return value
	echo "$qstnDestStrTest"

} # END FUNCTION: validateUserHost

function mod_trail_slash() {

	#----- Variables
	local action="$1"
	local path_raw="$2"
	local ret=''
	#-----/Variables

	case "$action" in

		"add")
			ret="$path_raw"
			if [ "${ret: -1}" != '/' ]; then ret="${ret}/"; fi # Add trailing slash
			;;

		"rem")
			ret="$path_raw"
			if [ "${ret: -1}" == '/' ]; then ret="${ret%?}"; fi
			;;

		*)
			ret=''
			;;

	esac

	echo "$ret"

} # END FUNCTION: mod_trail_slash

function isolate_dir_name() {

	#----- Variables
	local path_raw="$1"
	#----- Variables

	path_raw=`mod_trail_slash rem "$path_raw"`
	path_raw="${path_raw##*/}"
	
	echo "$path_raw"
	
} # END FUNCTION: isolate_dir_name
