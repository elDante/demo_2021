# -*- mode: ruby -*-
# vi: set ft=ruby :

SWARM_SIZE = 3
MONGODB_SHARD_COUNT = 3

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  (1..SWARM_SIZE).each do |node_id|
    config.vm.define "docker-#{node_id}" do |node|
      node.vm.hostname = "docker-#{node_id}"
      node.vm.network "private_network", type: "dhcp"

      if node_id == SWARM_SIZE
        node.vm.provision :ansible do |ansible|
          ansible.limit = "all"
          ansible.playbook = "provisioning/playbook.yml"
          ansible.groups = {
            "all:vars" => {'mongodb_shard_count' => MONGODB_SHARD_COUNT},
            "docker_engine" => (1..SWARM_SIZE).map { |id| "docker-#{id}" },
            "docker_swarm_manager" => (1..SWARM_SIZE).map { |id| "docker-#{id}" if id.odd? }.compact,
            "docker_swarm_worker" => (1..SWARM_SIZE).map { |id| "docker-#{id}" if id.even? }.compact,
            "docker_swarm_contol" => ['docker-1']
          }
        end
      end 
    end
  end
end
