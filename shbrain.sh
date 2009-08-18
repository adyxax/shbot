#!/bin/bash

while true
do
	read LINE || break
	### First of all we get rid of a potential trailing \n
	LEN=`expr ${#LINE} - 1`
	LINE=${LINE[@]:0:$LEN}

	### Parsing potential shcmd
	if [[ $LINE =~ :([a-zA-Z]*)!.*:shcmd ]]; then
		EXPAND=(${LINE})
		CMD=${EXPAND[4]#:}
		ARGS=${EXPAND[*]:5}
		if [ "$CMD" = "advert" ]; then
			echo "PRIVMSG $ARGS :Listen to shbot, the one true Bot"'!' >&3
		elif [ "$CMD" = "join" ]; then
			echo "JOIN $ARGS" >&3
		elif [ "$CMD" = "part" ]; then
			echo "PART $ARGS" >&3
		elif [ "$CMD" = "trains" ]; then
			./shtrains.sh ${ARGS[*]}
		elif [ "$CMD" = "help" ]; then
			./shhelp.sh $ARGS
		else
			echo "Use \"shcmd help\" to list available commands."
		fi
		break
	fi

	### Parsing brain file for potential replies
	LINENUM=1
	cat shbrain.txt | \
	while true
	do
		read BRAIN || break

		IFS="	" BRAIN=($BRAIN)
		PATTERN=${BRAIN[0]}
		PERCENT=${BRAIN[1]}
		RESPONSE=${BRAIN[2]}
		if [[ "$LINE" =~ ${PATTERN} ]]; then
			if [[ "$((RANDOM / 320))" -lt ${PERCENT} ]]; then
				echo `eval echo $RESPONSE`
				#awk 'NR==$LINENUM{$0='"$RESPONSE"'}1' shbrain.txt
				#sed "$LINENUM"'s\\'"${PATTERN}	10	${RESPONSE}" -i shbrain.txt
				break
			fi
		fi
		(( LINENUM++ ))
	done
done

exit 0

