# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant_API_Version ="2"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.



Vagrant.configure(Vagrant_API_Version) do |config|
  #Ansible-Node01
  config.vm.define:"ansible-node01" do |cfg|
  cfg.vm.box = "centos/7"
  cfg.vm.provider:virtualbox do |vb|
    vb.name="Ansible-Node01"
	vb.customize ["modifyvm", :id, "--cpus",1]
	vb.customize ["modifyvm", :id, "--memory",512]
  end
  cfg.vm.host_name="ansible-node01"
  cfg.vm.synced_folder ".", "/vagrant", disabled: true
  cfg.vm.network "public_network", ip: "192.168.219.11"
  cfg.vm.network "forwarded_port", guest: 22, host: 19211,auto_correct: false, id: "ssh"
  cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end
  
  #Ansible-Node02
  config.vm.define:"ansible-node02" do |cfg|
  cfg.vm.box = "centos/7"
  cfg.vm.provider:virtualbox do |vb|
    vb.name="Ansible-Node02"
	vb.customize ["modifyvm", :id, "--cpus",1]
	vb.customize ["modifyvm", :id, "--memory",512]
  end
  cfg.vm.host_name="ansible-node02"
  cfg.vm.synced_folder ".", "/vagrant", disabled: true
  cfg.vm.network "public_network", ip: "192.168.219.12"
  cfg.vm.network "forwarded_port", guest: 22, host: 19212,auto_correct: false, id: "ssh"
  cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end
#Ansible-Server
  config.vm.define:"ansible-server" do |cfg|
  cfg.vm.box = "centos/7"
  cfg.vm.provider:virtualbox do |vb|
    vb.name="Ansible-Server"
  end
  cfg.vm.host_name="ansible-server"
  cfg.vm.synced_folder ".", "/vagrant", disabled: true
  cfg.vm.network "public_network", ip: "192.168.219.10"
  cfg.vm.network "forwarded_port", guest: 22, host: 19210,auto_correct: false, id: "ssh"
  cfg.vm.provision "shell", path: "bootstrap.sh"
  cfg.vm.provision "file", source: "Ansible_env_ready.yml", destination: "Ansible_env_ready.yml"
  cfg.vm.provision "shell", inline: "ansible-playbook Ansible_env_ready.yml"
  cfg.vm.provision "shell", path: "add_ssh_auth.sh", privileged: false
  cfg.vm.provision "file", source: "Ansible_ssh_conf_4_CentOS.yml", destination: "Ansible_ssh_conf_4_CentOS.yml"
  cfg.vm.provision "shell", inline: "ansible-playbook Ansible_ssh_conf_4_CentOS.yml"
  end
end
