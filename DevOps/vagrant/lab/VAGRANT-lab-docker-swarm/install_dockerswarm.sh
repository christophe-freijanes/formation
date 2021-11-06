#!/bin/bash
sudo apt-get update && apt-get upgrade -y

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
# Installation Docker Swarm
sudo apt-get install apt-transport-https software-properties-common ca-certificates -y
wget https://download.docker.com/linux/ubuntu/gpg && sudo apt-key add gpg
sudo add-apt-repository "deb https://download.docker.com/linux/debian stretch stable"
sudo apt-get update