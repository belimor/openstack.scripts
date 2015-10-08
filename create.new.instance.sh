#!/bin/bash


nova keypair-list
nova image-list
nova flavor-list

exit

if [ -z $1 ] 
  then
    echo "Please specify instance name: ./create.new.instance.sh [instance.name.ca]"
  else
    if [ -z $2 ]
      then 
        myflavor="2"
      else
        myflavor="$2"
    fi
    if [ -z $3 ]
      then 
        myimage="Fresh.Ubuntu.14.04"
      else
        myimage="$3"
    fi
  echo "./create.new.instance.sh instance_name [flavour_id] [image_name]"
  echo "nova boot --flavor $myflavor --image $myimage --key-name dmtr --security-groups ALL_ICMP,ALL_to_CYBERA,Infrastructure $1"
  echo "Ready to create new instance"
  read -rsp $'Press any key to continue... Ctrl+C to cancel.\n' -n1 key

  echo "test"

nova boot --flavor 2 --image Fresh.Ubuntu.14.04 --key-name dmtr --security-groups ALL_ICMP,ALL_to_CYBERA,Infrastructure $1

sleep 15

/root/bin/add.new.ips.to.Infrastructure.sh
/root/bin/remove.new.ips.to.Infrastructure.sh
/root/bin/update.hosts.file.sh

fi
