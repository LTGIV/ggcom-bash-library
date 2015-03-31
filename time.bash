#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Time v201503210639
# Louis T. Getterman IV (@LTGIV)
# www.GotGetLLC.com | www.opensour.cc/ggcom/lib/time
#
# Example usage:
# source "$HOME/ggcom/ggcom-bash-library/time.bash"
# start_ts=10:33:56
# stop_ts=10:36:10
# START=$(ts_get_sec $start_ts) && STOP=$(ts_get_sec $stop_ts)
# DIFF=$((STOP-START))
# echo "$((DIFF/60))m $((DIFF%60))s"
#
# Thanks:
# http://stackoverflow.com/questions/8903239/how-to-calculate-time-difference-in-bash-script
# http://stackoverflow.com/questions/12199631/convert-seconds-to-hours-minutes-seconds-in-bash
# http://unix.stackexchange.com/questions/34017/convert-linux-sysuptime-to-well-format-date
# http://www.linuxquestions.org/questions/programming-9/convert-total-no-of-seconds-in-the-format-hour-minutes-and-seconds-276427/

ts_get_sec() {
# http://stackoverflow.com/questions/8903239/how-to-calculate-time-difference-in-bash-script
  read -r h m s <<< $(echo $1 | tr ':' ' ' )
  echo $(((h*60*60)+(m*60)+s))
}

ts_get_msec() {
# http://stackoverflow.com/questions/8903239/how-to-calculate-time-difference-in-bash-script
  read -r h m s ms <<< $(echo $1 | tr '.:' ' ' )
  echo $(((h*60*60*1000)+(m*60*1000)+(s*1000)+ms))
}

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

function iso8601() {

	#----- Variables
	local color=''
	#-----/Variables

	# Check for color existence
	if [ ! -z "$1" ]; then
		color="\$ggc${1}"
		color=`eval echo "$color"`
		if [ -z "$color" ]; then color=''; fi
	fi

	# This function is still a work in progress, and Unix/OSX don't work with: date -u --date=@1404372514
	# http://stackoverflow.com/questions/24547655/bash-get-utc-time-in-second

	if [ ! -z "$color" ]; then
		echo "${color}`date +"%Y-%m-%d %H:%M:%S"`${ggcNC}"

	else
		echo `date +"%Y-%m-%d %H:%M:%S"`

	fi

} # END FUNCTION: iso8601
