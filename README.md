# openstack.scripts
scripts to automate openstack tasks (adding security rules, create instances etc.)

Rapid Openstack Workspace
- create base instance where all deplyment starts
- update and upgrade instance. install git package.
- git clone openstack.scripts.
- create and source openstack openrc file
- create security groups: CloudLocalTrust, OpenAllToMyIP, Default(open all ICMP), OpenALL(just for test).
- create private key. upload to swift storage.
- install openstack tools
- download private key to the base instance
- create daily job to keep 
- enable root ssh with key authentication

