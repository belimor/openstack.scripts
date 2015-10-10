#!/bin/bash

# Security Group ID for cloud instances local IPs
# nova secgroup-list
SecGrpID=$(cat local.trust.security.groupe.id)
if [ ! -f local.trust.security.groupe.id ] || [ -z $SecGrpID ]
  then
    nova secgroup-list
    echo "Please enter security groupe ID: "
    read SecGrpID
    echo ${SecGrpID} > local.trust.security.groupe.id
  else
    nova secgroup-list | grep ${SecGrpID}
fi
# ----------------------------------------------------------------------------------
liveIPs=$(nova list | grep cybera= | awk -F= '{print $2}' | awk -F, '{print $1}')
echo ""
echo "===== List of IPs (Before) ====="
echo "Project__IPs:" $liveIPs | tr " " "\n" | sort -n | tr "\n" " "
echo ""
fwIPs=$(nova secgroup-list-rules ${SecGrpID} | grep / | awk '{print $8}' | awk -F/ '{print $1}' | uniq)
echo "Firewall_IPs:" $fwIPs | tr " " "\n" | sort -n | tr "\n" " "
echo ""
echo ""
echo "Updating..."
action="no"
for i in $liveIPs
	do
	for j in $fwIPs
		do
		if [ $i == $j ] 
			then
			action="yes"
		fi
		done
	if [ $action == "yes" ]
	  then 
		action="no"
	  else
		nova secgroup-add-rule ${SecGrpID} tcp 1 65535 ${i}/32
                nova secgroup-add-rule ${SecGrpID} udp 1 65535 ${i}/32
                echo "New rule has been added!"
	fi
	done

liveIPs=$(nova list | grep cybera= | awk -F= '{print $2}' | awk -F, '{print $1}')
echo ""
echo "===== List of IPs (After) ====="
echo "Project__IPs:" $liveIPs | tr " " "\n" | sort -n | tr "\n" " "
echo ""
fwIPs=$(nova secgroup-list-rules ${SecGrpID} | grep / | awk '{print $8}' | awk -F/ '{print $1}' | uniq)
echo "Firewall_IPs:" $fwIPs | tr " " "\n" | sort -n | tr "\n" " "
echo ""
# ----------------------------------------------------------------------------------
#for i in $(nova list | grep cybera= | awk -F= '{print $2}' | awk -F, '{print $1}'); do echo "--- $i"; done
#nova secgroup-list-rules 2321 | grep / | awk '{print $8}' | awk -F/ '{print $1}' | uniq
