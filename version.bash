#!/usr/bin/env bash
: <<'!COMMENT'

GGCOM - Bash - Library - Version v201504162001
Louis T. Getterman IV (@LTGIV)
www.GotGetLLC.com | www.opensour.cc/ggcom/lib/version

Example usage:
source "version.bash"
echo "`getVersion '/usr/bin/dfwu.py' [line|header|program|number]`"

!COMMENT

function getVersion() {
	local path="${1-$0}"
	local type="${2-number}"
	
	local versLine=`head -n5 "$path" | grep -n 'v[0-9]' | cut -f1 -d:`
	local versHead=`tail -n+"$versLine" "$path" | head -n3 | sed 's/# *//g'`
	local versProg=`echo "$versHead" | head -n1`
	local versNum=`echo "$versHead" | grep -Eo 'v[0-9]{1,}' | grep -Eo '[0-9]{1,}'`
	
	local veret=''
	
	case $type in
		line)
			veret="$versLine"
			;;

		(header|head)
			veret="$versHead"
			;;

		(program|name|title)
			veret="$versProg"
			;;
		
		number)
			veret="$versNum"
			;;
		
		*)
			veret="$versNum"
			;;
	esac
	
	echo "$veret"
} # END FUNCTION
