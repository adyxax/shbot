#! /bin/bash

SERVER=${1:-kro.corp}
#SERVER=${1:-localhost}
PORT=6667
export NICK=shbot
export CHANNELS=('#codemore #shbot')

function shbirth ()
{
	echo "NICK $NICK"
	echo "USER $(whoami) +iw $NICK :$0"
	for CHANNEL in $CHANNELS
	do
		echo "JOIN $CHANNEL"
	done
}
