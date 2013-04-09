ballin-octo-sansa
=================

Vagrant and puppet files for launching a dev Accumulo VM


Setup and running
-----------------

### Vagrant Dev VM
1. Install [Vagrant](http://www.vagrantup.com)
1. Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
1. Add this project as a submodule to your project
  * git submodule add git@github.com:texeltek/ballin-octo-sansa.git
1. Copy the Vagrantfile from this project into the root directory as your project
1. Copy the ballin-octo-sansa directory and its contents into the root directory of your project
1. From the same directory as the Vagrantfile (i.e. the root directory as your project), run "vagrant up"
  * If this is a first time run it will take a while as Vagrant does the following
    * Downloads a vm from redhat
    * provisions the VM via puppet
1. Once the VM has been provisioned, log into the box: vagrant ssh
1. su to the root user using "su -" with the password "vagrant"
1. run "$HADOOP_HOME/bin/start-all.sh"
1. Wait about 2 minutes for hadoop to be fully up before doing anything else
1. run "ACCUMULO_HOME/bin/accumulo init"
  * Set the instance name to "vagrant"
  * Set the root password to "root"
1. run $ACCUMULO_HOME/bin/start-all.sh"
1. Wait about 2 minutes for accumulo to be fully up before doing anything else
1. Make sure you can log into the shell
  * $ACCUMULO_HOME/bin/accumulo shell -u root -p root
  * enter "exit" to leave the shell
1. create the gem tables
  * run $ACCUMULO_HOME/bin/create_gem_tables.sh"
  * when propmted for a password for the created "gem" user, enter "gem"
  * go get a "red bull" this may take a while to run
1. cd into the /vagrant directory on the vm.  This is a shared folder with your project root folder.  You can run mvn commands here, including your integration tests which connet to and use GEM


### Common Vagrant Commands
  * 'vagrant up' - bring up the vm and run puppet
  * 'vagrant halt' - stop the vm
  * 'vagrant destroy' - delete the vm (this will not delete the downloaded box)
  * 'vagrant provision' - run puppet on the vm
