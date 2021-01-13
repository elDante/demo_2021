# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  (1..2).each do |i|
    config.vm.define "docker-#{i}" do |node|
      node.vm.network "private_network", type: "dhcp"

      node.vm.disk :disk, name: "data", size: "10GB"

      node.vm.provision "shell", inline: "echo hello from node #{i}"
    end
  end
end
