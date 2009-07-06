#!/bin/bash

source ./shbirth.sh
exec 3<>/dev/tcp/$SERVER/$PORT
shbirth 1>&3

while true
do
	read LINE 0<&3 || break
	echo "<-- "$LINE
	if [[ "$LINE" =~ PING\ *:(.*) ]]; then
		echo "PONG :${BASH_REMATCH[1]}" >&3
		sleep 0.1
	else
		echo "${LINE}" | ./shbrain.sh | \
		while true
		do
			read ANSWER || break
			echo "--> "$ANSWER
			echo $ANSWER >&3
		done
	fi
done

exec 3>&-
exit 0

