# http://www.linuxjournal.com/content/return-values-bash-functions
# http://stackoverflow.com/questions/5349718/how-can-i-repeat-a-character-in-bash
# echo `str_repeat - 80`
function str_repeat()
{
    local  char=$1
    local  repeat=$2

    local  stat="`seq -s${char} ${repeat} | tr -d '[:digit:]'`"

    echo $stat
}
