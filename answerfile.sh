#!/bin/bash

# choosing private key for the instance
i=0; j=1; mykey=()
for L in $(nova keypair-list | grep ":"); do
  if [ $L != "|" ]
    then
      ## check if the number is even
      if [ $((i%2)) -eq 0 ]
        then
          echo "$j $L"
	  mykey[$j-1]="$L"
	  ((j++))
      fi
          ((i++))
  fi
done
echo "Please choose your key: "
read myinput
i=0;
for S in ${mykey[@]}; do
  echo $S
  echo ${mykey[$i]}
  ((i++))
done


#nova image-list
#nova flavor-list

