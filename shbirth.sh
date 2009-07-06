#! /bin/bash

SERVER=${1:-kro.corp}
#SERVER=${1:-localhost}
PORT=6667
export NICK=shbot
export CHANNELS=${2:-#codemore}
export CHANNEL2=${2:-#shbot}

function shbirth ()
{
	echo "NICK $NICK"
	echo "USER $(whoami) +iw $NICK :$0"
	#echo "JOIN $CHANNEL"
	echo "JOIN $CHANNEL2"
}
