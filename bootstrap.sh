#!/bin/bash

mypuppetservera="puppetmaster.ca"

echo "====================> System Upgrade"
sleep 3
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive 
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get install git -y

echo -e "\n"
echo "====================> Openstack tools installation"
sleep 3
sudo apt-get install -y python-pip python-dev
sudo apt-get install -y libssl-dev libffi-dev

sudo pip install python-keystoneclient
sudo pip install python-novaclient
sudo pip install python-swiftclient
sudo pip install python-glanceclient
sudo pip install python-cinderclient

sudo pip install pyopenssl ndg-httpsclient pyasn1

echo -e "\n"
echo "=====================> Installing Puppet Client"
sleep 3
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
rm puppetlabs-release-trusty.deb
apt-get update

apt-get install -y puppet

sed -i 's/templatedir=$confdir\/templates/#templatedir=\$confdir\/templates/g' /etc/puppet/puppet.conf 
sed -i "/[main]/a server=${mypuppetserver}" /etc/puppet/puppet.conf

puppet agent -t
