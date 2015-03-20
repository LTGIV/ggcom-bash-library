#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Strings v201503200106
# Louis T. Getterman IV (@LTGIV)
# www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/string
#
# Example usage:
# source "string.bash"
# echo `str_repeat - 80`
#
# Thanks:
# http://www.linuxjournal.com/content/return-values-bash-functions
# http://stackoverflow.com/questions/5349718/how-can-i-repeat-a-character-in-bash
# http://forums.gentoo.org/viewtopic-t-660965-view-previous.html

# echo `str_repeat - 80`
function str_repeat()
{
    local  char=$1
    local  repeat=$2

    local  stat="`seq -s${char} ${repeat} | tr -d '[:digit:]'`"

    echo $stat
} # END FUNCTION: str_repeat

function parseUserHost() {
	local	raw=$1
	local	choice=$2

	local	user="${raw%@*}"		# BEFORE @
	local	rawhost="${raw#*@}"		# AFTER  @
	local	host="${rawhost%:*}"	# BEFORE :
	local	path="${rawhost#*:}"	# AFTER  :

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
