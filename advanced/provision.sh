#!/usr/bin/env bash

echo "Update all existing packages"
sudo yum update -y

echo "Install dependencies"
sudo yum install git -y

if [ ! -f /etc/yum.repos.d/mongodb.repo ]
then
  echo "Installing MongoDB"
  sudo cp /vagrant/configs/mongodb.repo /etc/yum.repos.d/mongodb.repo
  sudo yum install mongodb-org -y
else
  echo "MongoDB has already been added"
fi

echo "Make sure MongoDB is not running"
sudo service mongod stop

if [ ! -d /home/vagrant/mongo-hacker/ ]
then
  echo "Installing Mongo Hacker"
  cd /home/vagrant/
  git clone https://github.com/TylerBrock/mongo-hacker.git
  cd mongo-hacker/
  make
else
  echo "Mongo Hacker has already been added"
fi

echo "All done..."
