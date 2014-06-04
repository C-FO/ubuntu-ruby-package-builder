# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$install_the_packages =<<EOF
  apt-get install -y git build-essential ruby ruby-dev
EOF

$setup_fpm =<<EOF
  gem install fpm
EOF

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento-Ubuntu-14.04-x86_64"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
  config.vm.box_check_update = true

  config.vm.network "private_network", ip: "192.168.33.222"
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "384"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision :shell, inline: $install_the_packages
  config.vm.provision :shell, inline: $setup_fpm
end
