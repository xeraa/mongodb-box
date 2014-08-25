#!/usr/bin/env bash

echo "Update all existing packages"
sudo yum update -y

if [ ! -f /etc/yum.repos.d/mongodb.repo ]
then
  echo "Installing MongoDB"
  sudo cp /home/vagrant/logout/configs/mongodb.repo /etc/yum.repos.d/mongodb.repo
  sudo yum install mongodb-org -y
  sudo service mongod start
  sudo chkconfig mongod on
else
  echo "MongoDB has already been added"
fi

echo "Checking the status of MongoDB"
sudo service mongod status

echo All done...
