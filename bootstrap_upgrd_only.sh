#!/bin/bash

echo -e "/n"
echo "====================> System Upgrade"
sleep 3
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive 
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get install git -y

