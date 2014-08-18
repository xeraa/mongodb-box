# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


# Our custom installation routine
$script = <<SCRIPT
echo Update all existing packages
sudo yum update -y

if [ ! -f /etc/yum.repos.d/mongodb.repo ]
then
  echo Installing MongoDB
  sudo cp /home/vagrant/logout/configs/mongodb.repo /etc/yum.repos.d/mongodb.repo
  sudo yum install mongodb-org -y
  sudo service mongod start
  sudo chkconfig mongod on
else
  echo MongoDB has already been added
fi

echo Checking the status of MongoDB
sudo service mongod status

echo All done...
SCRIPT


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  # https://vagrantcloud.com/jayunit100/centos7
  config.vm.box = "jayunit100/centos7"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Forward MongoDB
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.network "forwarded_port", guest: 28017, host: 28017



  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--name", "mongodb"]
  end


  # Fix https://github.com/mitchellh/vagrant/issues/1673
  config.ssh.pty = true


  # Install our dependencies
  config.vm.provision "shell", inline: $script


end
