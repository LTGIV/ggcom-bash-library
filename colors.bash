#!/usr/bin/env bash
#
# GGCOM - Bash - Library - Colors v201503141810
# Louis T. Getterman IV (@LTGIV)
# www.GotGetLLC.com | www.opensour.cc/ggcom/lib/colors
#
# Example usage:
# source "colors.bash"
# echo -e "${ggcPurple}`whoami`${ggcNC}@${ggcCyan}`hostname -s`${ggcNC}"
#
# Thanks:
# http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

ggcBlack='\033[0;30m'
ggcBlue='\033[0;34m'
ggcGreen='\033[0;32m'
ggcCyan='\033[0;36m'
ggcRed='\033[0;31m'
ggcPurple='\033[0;35m'
ggcBrownOrange='\033[0;33m'
ggcLightGray='\033[0;37m'
ggcDarkGray='\033[1;30m'
ggcLightBlue='\033[1;34m'
ggcLightGreen='\033[1;32m'
ggcLightCyan='\033[1;36m'
ggcLightRed='\033[1;31m'
ggcLightPurple='\033[1;35m'
ggcYellow='\033[1;33m'
ggcWhite='\033[1;37m'
ggcNC='\033[0m' # No Color
