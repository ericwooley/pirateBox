# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "public_network", ip: "192.168.1.121", bridge: 'en0: Wi-Fi (AirPort)'
  #config.vm.provision :shell, :path => "useApt-cacher-ng.sh"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => ".setupScripts/sabnzbd.sh"
  config.vm.provision :shell, :path => ".setupScripts/nzbdrone.sh"
  config.vm.provision :shell, :path => ".setupScripts/couchPotato.sh"
  config.vm.provision :shell, :path => ".setupScripts/plex.sh"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
end
