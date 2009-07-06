#!/bin/bash

links -dump 'http://transilien.mobi/pam/TempReelSaisieDepartSubmit.do?debutDepart=Courbevoie&tous=Tous+trains'  > trains.tmp
#wget -q -O trains.tmp 'http://transilien.mobi/pam/TempReelSaisieDepartSubmit.do?debutDepart=Courbevoie&tous=Tous+trains'

echo "PRIVMSG $CHANNEL2 :"$*

exit 0

