require 'vagrant-openstack-plugin'

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  ssh_key = “name.pem” # PATH TO YOUR PRIVATE KEY

  config.vm.provider :openstack do |os|
    os.username = ENV['OS_USERNAME']
    os.api_key = ENV['OS_PASSWORD']
    os.tenant = ENV['OS_TENANT_NAME']
    os.flavor = /m1.small/ # Regex or String
    os.image = “Ubuntu 14.04” # Regex or String
    os.endpoint = "#{ENV['OS_AUTH_URL']}/tokens"
    os.keypair_name = "name" # as stored in Nova
    os.ssh_username = "ubuntu" # login for the VM
    #os.address_id = "cybera" # Enable for IPv6
    os.security_groups = ['default'] # optional
    #os.floating_ip = "XXX.YYY.ZZZ.114" # optional (The floating IP to assign for this instance)
  end
end
