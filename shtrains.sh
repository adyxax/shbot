#!/bin/bash

links -dump 'http://transilien.mobi/pam/TempReelSaisieDepartSubmit.do?debutDepart=Courbevoie&tous=Tous+trains' >trains.tmp

cat trains.tmp | \
while true
do
	while true
	do
		read PATTERN || break
		if [[ $PATTERN =~ \ *[A-Z]{4}\ *(.*)\ *Voie ]]; then
			PATTERN=${BASH_REMATCH[1]}
			break
		fi
	done
	read STATION || break
	read UGUU || break
	if [[ $UGUU =~ Supprime ]]; then
		read UGUU || break
		continue
	fi
	#[[ $STATION =~ Versailles\ Rive\ Droite ]] && STATION="Versailles Rive Droit"
	if [ -n "$*" ]; then
		[[ $STATION =~ $@ ]] && echo "$PATTERN $STATION"
	else
		echo "$PATTERN $STATION"
	fi
done

exit 0

