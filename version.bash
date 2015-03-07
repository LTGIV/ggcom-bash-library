#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Version v201503030304
# Louis T. Getterman IV (@LTGIV)
# www.GotGetLLC.com | www.opensour.cc/ggcom/lib/version
#
# Example usage:
# source "version.bash"
# echo "`getVersion '/usr/bin/dfwu.py' [line|header|program|number]`"

function getVersion() {
	local path=${1-$0}
	local type=${2-number}
	
	local versLine=`head -n5 "$path" | grep -n 'v[0-9]' | cut -f1 -d:`
	local versHead=`tail -n+"$versLine" "$path" | head -n3 | sed 's/# *//g'`
	local versProg=`echo "$versHead" | head -n1`
	local versNum=`echo "$versHead" | grep -Eo 'v[0-9]{1,}' | grep -Eo '[0-9]{1,}'`
	
	local veret=''
	
	case $type in
		line)
			veret=$versLine
			;;

		header)
			veret=$versHead
			;;

		program)
			veret=$versProg
			;;
		
		number)
			veret=$versNum
			;;
		
		*)
			veret=$versNum
			;;
	esac
	
	echo "$veret"
} # END FUNCTION
