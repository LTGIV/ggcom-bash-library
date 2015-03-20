#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Time v201503200134
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
