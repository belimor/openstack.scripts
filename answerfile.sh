#!/bin/bash

# choosing private key for the instance
i=0; j=1
for L in $(nova keypair-list | grep ":"); do
  if [ $L != "|" ]
    then
      ## check if the number is even
      if [ $((i%2)) -eq 0 ]
        then
          echo "$j $L"
	  ((j++))
      fi
          ((i++))
  fi
done
echo "Please choose your key: "
read myinput

#nova image-list
#nova flavor-list

