# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
NUM_RIAK_NODES = 5

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "saucy-amd"

  config.vm.define "web" do |web|
    web.vm.network "private_network",
      ip: "192.168.50.2", virtualbox__intnet: "riakhaskellnetwork"
    web.vm.provision "shell", path: "vagrant-files/haskell-build.sh"
    web.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end

  config.vm.define "haproxy" do |ha|
    ha.vm.network "private_network",
      ip: "192.168.50.3", virtualbox__intnet: "riakhaskellnetwork"
    ha.vm.provision "shell", path: "vagrant-files/haproxy-build.sh"
  end

# Base node is 192.168.50.10
# Subsequent nodes are .11/.12/etc
  (1..NUM_RIAK_NODES).each do |i|
    config.vm.define "riak#{i}" do |riakx|
      riakx.vm.network "private_network",
        ip: "192.168.50.#{i+9}", virtualbox__intnet: "riakhaskellnetwork"
      riakx.vm.provision "shell", path: "vagrant-files/riak-build.sh", args: "192.168.50.#{i+9} 192.168.50.10"
    end
  end
end
