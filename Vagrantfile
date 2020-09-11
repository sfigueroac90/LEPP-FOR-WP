# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # box at https://app.vagrantup.com/generic/boxes/rhel8
  config.vm.box = "centos/8"
  #config.ssh.private_key_path = "~/.ssh/id_rsa"
  #config.ssh.forward_agent = true
  #config.ssh.insert_key = false
  #config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  # please review: startup_firewall.sh
  config.vm.network "forwarded_port", guest: 5000, host: 5001
  config.vm.network "forwarded_port", guest: 3000, host: 3001 
  config.vm.network "forwarded_port", guest: 80, host: 8080 
  config.vm.network "forwarded_port", guest: 9000, host: 9001 
  config.vm.network "forwarded_port", guest: 20, host: 20 
  config.vm.network "forwarded_port", guest: 21, host: 21
  config.vm.network "forwarded_port", guest: 22, host: 22 #, host_ip: "0.0.0.0", id: "ssh", auto_correct: true
  
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
   config.vm.network "public_network"

  # Share an additional folder to the guest VM. 
  # config.vm.synced_folder "./shared_data", "/shared_data"
  
  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: './startup_workstation.sh'
  config.vm.provision "shell", path: './startup_nodejs.sh'
  config.vm.provision "shell", path: './startup_nginx.sh'
  config.vm.provision "shell", path: './startup_firewall.sh'
  config.vm.provision "shell", path: './create_test_reactapp.sh'
  config.vm.provision "shell", path: './startup_LEMP_PostgreSQL.sh'
  config.vm.provision "shell", path: './startup_wpcli.sh' #, run: 'always'
  config.vm.provision "shell", path: './extras.sh'
end
