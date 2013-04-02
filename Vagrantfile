# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centosx64-minimal"

  config.vm.synced_folder "~/.m2/repository", "/m2repo"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"


  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "ballin-octo-sansa/puppet/modules"
    puppet.manifests_path = "ballin-octo-sansa/puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end

end
