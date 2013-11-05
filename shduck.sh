#!/bin/bash

# Duck generation based on https://github.com/adyxax/hsbot

RANDOM=$$ #Seed random number generator from script PID
export GLOBIGNORE="*" #Do not substitute asterisks (e.g. in $heads) for lists of files!!

#Body parts (both RTL and LTR where applicable)
leftbeaks=(">" "=")
rightbeaks=("<" "=")
leftbody=("_/" "__/" "_~" "__~")
rightbody=("\\\\_" "\\\\__" "~_" "~__")
heads=("o" "O" "0" "@" "©" "®" "ð" "*" "ò" "ô" "ó" "ø" "⊕" "Ω" "ꙫ" "ꙩ" "Ꙩ" "ȯ" "◔" "õ" "ȯ" "⁰" "Ö" "Ó" "Ò" "Õ" "Ô" "ö")

head=${heads[$RANDOM % ${#heads[@]} ]} #Pick a head

left=$(expr $RANDOM % 2) #Whether it will be a left-to-right duck

#Generate the duck
if [ $left == 1 ]; then
  beak=${leftbeaks[$RANDOM % ${#leftbeaks[@]} ]}
  body=${leftbody[$RANDOM % ${#leftbody[@]} ]}
  duck=$beak$head$body
else
  beak=${rightbeaks[$RANDOM % ${#rightbeaks[@]} ]}
  body=${rightbody[$RANDOM % ${#rightbody[@]} ]}
  duck=$body$head$beak
fi

echo $duck
