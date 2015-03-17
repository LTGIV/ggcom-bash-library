#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Variables for Bash v201503030304
# Louis T. Getterman IV (@LTGIV)
# www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/vars
#
# Example usage:
# source "varsBash.bash"
# echo "$SCRIPTPATH - $SCRIPTNAME - $LIBNAME"

# https://www.google.com/search?q=bash+script+name+without+path&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a&channel=fflb
# https://www.google.com/search?q=bash+name+of+script&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a&channel=fflb
# http://stackoverflow.com/questions/192319/how-do-i-know-the-script-file-name-in-a-bash-script
# https://www.google.com/search?q=%22%24%28+cd+%22%24%28dirname+%22%240%22%29%22+%3B+pwd+-P+%29%22&ie=utf-8&oe=utf-8
# http://www.commandlinefu.com/commands/view/9793/get-full-directory-path-of-a-script-regardless-of-where-it-is-run-from
# https://www.google.com/search?q=%24%28+cd+%22%24%28dirname+%22%240%22%29%22+%3B+pwd+-P+%29&ie=utf-8&oe=utf-8
# http://stackoverflow.com/questions/9087800/bash-script-how-to-get-script-directory-so-that-it-runs-in-cron
# https://www.google.com/search?q=bash+validate+ip+address&ie=utf-8&oe=utf-8
# http://www.linuxjournal.com/content/validating-ip-address-bash-script
# https://stackoverflow.com/questions/630372/determine-the-path-of-the-executing-bash-script
# http://www.thegeekstuff.com/2010/06/bash-if-statement-examples/
# http://www.cyberciti.biz/faq/bash-while-loop/
# https://www.darklaunch.com/2012/07/12/bash-increment-counter-integer-variable
# https://stackoverflow.com/questions/2556190/random-number-from-a-range-in-a-bash-script
# https://stackoverflow.com/questions/13322485/how-to-i-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x
# https://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash
# http://adambuchanan.me/post/25473551700/dynamic-dns-with-bash-afraid-org
# http://www.cyberciti.biz/tips/linux-unix-pause-command.html
# http://www.linuxjournal.com/content/return-values-bash-functions
# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself

# Bash run script path
#SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )

# Bash run script name
#SCRIPTNAME=`basename $0`

# This Library
#LIBPATH=$( cd "$(dirname "$BASH_SOURCE")" ; pwd -P )
LIBNAME=$(basename $BASH_SOURCE)

function updates_get()
{
	echo -n ''
}

function updates_check()
{
	echo "<CHECK>"
	echo $SCRIPTPATH
	echo $SCRIPTNAME

	echo $LIBPATH
	echo $LIBNAME
	echo "</CHECK>"

	updates_get
}
