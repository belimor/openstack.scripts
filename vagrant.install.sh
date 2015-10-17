#!/bin/bash

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb
dpkg -i vagrant_1.7.4_x86_64.deb 
vagrant plugin install vagrant-openstack-plugin
vagrant box add dummy https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box
#vagrant box install dummy
#vagrant box add ubuntu/trusty64
