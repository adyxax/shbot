#!/bin/bash -ex

case "$1" in
	"help") echo "help <TOPIC> : Prints help about TOPIC."
	;;
	"trains") echo "trains [STATION] : Prints the next trains that will stop at Courbevoie's station."
	echo "    When provided, only results that concerns STATION are advertised."
	;;
	*) echo "The following commands are available : help trains"
	;;
esac

exit 0

