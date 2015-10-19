#!/bin/bash

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive 
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get install git -y

sudo apt-get install -y python-pip python-dev
sudo apt-get install -y libssl-dev libffi-dev

sudo pip install python-keystoneclient
sudo pip install python-novaclient
sudo pip install python-swiftclient
sudo pip install python-glanceclient
sudo pip install python-cinderclient

sudo pip install pyopenssl ndg-httpsclient pyasn1
