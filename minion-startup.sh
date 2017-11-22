#!bin/sh
# To be executed to make a nice salt-minion

# Setting the right timezone
timedatectl set-timezone 'Europe/Amsterdam'

#adding hostname to /etc/hosts to avoid sudo messages later
echo "127.0.1.1 $(hostname)" >> /etc/hosts

#updating sources
#Getting the saltstack public key to add to apt
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
#Copying the repo to a source list
sh -c 'echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >> /etc/apt/sources.list.d/saltstack.list'
#updating apt so it includes the new source
apt-get update -y

#installing the minion
apt-get install salt-minion -y

#from here saltstack takes over