#!/bin/bash


allUUID=$( nova list --field=name,networks | grep cybera | awk '{print $2}' )

sed -i '/==============================/Q' /etc/hosts
echo "==============================" >> /etc/hosts
echo "" >> /etc/hosts
echo "Updating /etc/hosts ..."

for i in $allUUID; do
	hname=$( nova show ${i} | grep '^| name' | awk '{print $4}' )
	hip=$( nova show ${i} | grep network | awk '{print $5}' | awk -F, '{print $1}' )
	echo "$hip $hname" >> /etc/hosts
done
