#!/usr/bin/env bash

# http://www.cyberciti.biz/tips/linux-unix-pause-command.html

function pause(){
	read -p "$*";
} # END FUNCTION

function pauseret() {
	pause 'Press [Enter] key to continue...';
} # END FUNCTION
