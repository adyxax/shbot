#!/bin/bash

if [ -n "$2" ]; then
    ARGS=$* && ARGS=($ARGS)
    OWNER=$1
    LEN=`expr ${#ARGS[*]}`
    QUOTE=${ARGS[@]:1:$LEN}

    echo "${OWNER}" >> shquote.txt
    echo "${QUOTE}" >> shquote.txt
#elif [ -n "$1" ]; then
    # TODO : quote someone
else
    NB_LINES=(`wc -l shquote.txt`)
    LINE=$((RANDOM * NB_LINES[0] / 65534))

    # IFS="\r" LINES=(`tail -n $((LINE + 2)) shquote.txt | head -n 2`)
    # QUOTE=${LINES[0]}
    # OWNER=${LINES[1]}
    QUOTE=`tail -n $((LINE * 2 + 1)) shquote.txt | head -n 1`
    OWNER=`tail -n $((LINE * 2 + 2)) shquote.txt | head -n 1`
    echo "\"${QUOTE}\""
    echo "-- ${OWNER}"
fi

