#!/usr/bin/env bash
: <<'!COMMENT'

GGCOM - Bash - Library - Prompts v201507100702
Louis T. Getterman IV (@LTGIV)
www.GotGetLLC.com | www.opensour.cc/ggcom/bash/lib/prompt

Example usage:
source "prompt.bash"
pauseret

Thanks:

HowTo: Add Pause Prompt In a Shell Script ( bash pause command )
http://www.cyberciti.biz/tips/linux-unix-pause-command.html

Solution by mcoolive
http://stackoverflow.com/questions/12022592/how-can-i-use-long-options-with-the-bash-getopts-builtin

How to read command line arguments in a bash script - a great resource for How To's from Wikia
http://how-to.wikia.com/wiki/How_to_read_command_line_arguments_in_a_bash_script

bash how to pass array as an argument to a function - Stack Overflow
http://stackoverflow.com/questions/16461656/bash-how-to-pass-array-as-an-argument-to-a-function

!COMMENT

function pause(){
	read -p "$*";
} # END FUNCTION

function pauseret() {
	pause 'Press [Enter] key to continue...';
} # END FUNCTION

function qa_with_def() {

	#----- Variables
	local question="$1"
	local defAnswer="$2"
	local inpAnswer=''
	local numChar=${3-''}
	local timeout=${4-0}
	#-----/Variables

	if [[ "$numChar" =~ ^[0-9]+$ ]]; then
		read -n $numChar -p "$question [$defAnswer] : " inpAnswer
	else
		read -p "$question [$defAnswer] : " inpAnswer
	fi
	

	if [ -z "$inpAnswer" ]; then
		inpAnswer="$defAnswer"
	fi
	
	echo "$inpAnswer"

} # END FUNCTION: qa_with_def

function notifyalert() {

# Notification

	#----- Variables
	local	notifyapp="$1"
	local	notifyargs="$2"
	local	title="$3"
	local	message="$4"
	#-----/Variables

if [ ! -z "$notifyapp" ]; then
	eval $notifyapp "$( \
		str_replace "\%title\%" "$title" "$( \
		str_replace "\%message\%" "$message" "$notifyargs"
		)"
	)"
fi

} # END FUNCTION: notifyalert

function parseArgs() {

	# $# - Number of arguments
	# $@ / $* - All arguments

	#----- Variables
	local	rawArgs=("$@")

	((last_idx=${#rawArgs[@]} - 1))

	local	rawTrgt=${rawArgs[last_idx]}
	local	rawTrgts=${#rawTrgt}

	unset rawArgs[last_idx]
	rawArgsSize=${#rawArgs}

	local	boolFlag=False		# Flag?
	local	boolValues=False	# Values?
	local	boolBlobMatch=False	# Beginning segment matches?
	local	value=''			# Return
	#-----/Variables

	# Iterate through all arguments, and find the target
	for i in "${rawArgs[@]}"; do

		s=${#i}							# Size of entire argument (if applicable, with values)
		offset=$(( $s - $rawTrgts ))	# Offset of target size from current argument size
		blob="${i:0:$rawTrgts}"			# Potential match (would also match --targetTest if searching for --target)
		trail="${i:$rawTrgts}"			# Trailing Text after target size
		value="${i:$(( rawTrgts+1 ))}"	# X

		# Is this a boolean flag that we're searching for?  If offset is zero, then it is, and our return value is True.
		if [ $offset -eq 0 ] && [ "$i" = "$rawTrgt" ]; then
			boolFlag=True
			value=True
		fi

		# Blob match?
		[[ "$blob" = "$rawTrgt" ]] && boolBlobMatch=True || boolBlobMatch=False

		# Do we have values?  If character is '=', then it is.
		if [ "$boolBlobMatch" = True ] && [ "${trail:0:1}" = '=' ]; then
			boolValues=True
		else
			boolValues=False
		fi

		# No values are available in this iteration.
		if [ "$boolFlag" = False ] && [ "$boolValues" = False ]; then value=''; fi

: <<'!COMMENT'
		############################################## DEBUG BLOCK
		printf "All arguments:	"
		for rax in "${rawArgs[@]}"; do
			echo -n "$rax "
		done
		echo;
		echo "Size of all arguments:	$rawArgsSize"
		echo;
		#
		# (Insert any additional variables needed for debugging.)
		##############################################/DEBUG BLOCK
!COMMENT

		# Return desired value, and break out of loop.
		if [ ! -z "$value" ]; then
			printf "$value"
			break;
		fi

	done # END FOR

} # END FUNCTION: parseArgs
