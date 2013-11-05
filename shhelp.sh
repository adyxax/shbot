#!/usr/bin/env bash
set -e

case "$1" in
	"advert") echo "advert <CHANNEL> : Make shbot speak the truth about himself on the specified CHANNEL."
	;;
	"duck") echo "help <TOPIC> : Prints a cute duck."
	;;
	"help") echo "help <TOPIC> : Prints help about TOPIC."
	;;
	"join") echo "join <CHANNEL> : Make shbot join the specified CHANNEL."
	;;
	"part") echo "part <CHANNEL> : Make shbot part the specified CHANNEL."
	;;
	"quote") echo "quote [OWNER QUOTE] :"
	echo "    Without arguments : prints a random quote."
	echo "    if OWNER and QUOTE are provided : save the quote for posterity and legend."
	;;
	"trains") echo "trains [STATION] : Prints the next trains that will stop at Courbevoie's station."
	echo "    When provided, only results that concerns STATION are advertised."
	;;
	*) echo "The following commands are available : advert help join part quote trains duck"
	;;
esac

exit 0

