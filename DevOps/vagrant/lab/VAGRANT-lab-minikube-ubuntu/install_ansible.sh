#!/bin/bash
apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
apt-get -y update
apt-get install python3
if [ $1 == "master" ]
then

  # install ansible
  curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3
  /usr/local/bin/pip3 install ansible
  apt install -y sshpass
fi