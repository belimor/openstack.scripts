#!/bin/bash

apt-get update
apt-get -y upgrade

apt-get install -y python-pip python-dev
apt-get install -y libssl-dev libffi-dev

pip install python-keystoneclient
pip install python-novaclient
pip install python-swiftclient
pip install python-glanceclient
pip install python-cinderclient

pip install pyopenssl ndg-httpsclient pyasn1
