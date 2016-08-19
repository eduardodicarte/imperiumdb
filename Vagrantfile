# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_FILE_VERSION = 2

Vagrant.configure(VAGRANT_FILE_VERSION) do |config|
 
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  
  config.vm.define :db do |db_config|
	db_config.vm.network :private_network, :ip => "192.168.43.10" 
	
	db_config.ssh.username = 'root'
	db_config.ssh.password = 'puppet'
	db_config.ssh.insert_key = 'true'
	
  end

end

