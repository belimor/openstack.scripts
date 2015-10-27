#!/bin/bash

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb
dpkg -i vagrant_1.7.4_x86_64.deb 
vagrant plugin install vagrant-openstack-plugin
vagrant box add dummy https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box


## vagrant kvm plugins and kvm packages
#apt-get install cpu-checker
#echo -e "/n"
#echo "checking virtualisation support"
#kvm-ok
#egrep -c '(vmx|svm)' /proc/cpuinfo
#echo -e "/n"
#sleep 4
#
#apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
#apt-get install libvirt-dev
#apt-get install virt-manager
#
#vagrant plugin install vagrant-libvirt
#vagrant plugin install vagrant-mutate
#vagrant box add ubuntu/trusty64
#vagrant mutate ubuntu/trusty64 libvirt
#vagrant box list
#
#vagrant up --provider=libvirt
