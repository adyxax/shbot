#!/bin/bash

links -dump 'http://transilien.mobi/pam/TempReelSaisieDepartSubmit.do?debutDepart=Courbevoie&tous=Tous+trains' | head -n 22 | tail -n 18 >trains.tmp

cat trains.tmp | \
while true
do
	read PATTERN || break
	read STATION || break
	read UGUU || break
	[[ $PATTERN =~ \ *[A-Z]{4}\ *(.*) ]] && PATTERN=${BASH_REMATCH[1]}
	if [ -n "$*" ]; then
		[[ $STATION =~ $@ ]] && echo "$PATTERN $STATION"
	else
		echo "$PATTERN $STATION"
	fi
done

exit 0

