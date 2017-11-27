#!bin/sh
# To be executed to make a nice salt-minion

# Setting the right timezone
timedatectl set-timezone 'Europe/Amsterdam'

echo "127.0.1.1 $(hostname)" >> /etc/hosts

#updating sources
#Getting the saltstack public key to add to apt
#Copying the repo to a source list
#updating apt so it includes the new source
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
apt-get update -y

#installing all the tings
#installing the master and minion
#installing python-git to be able to use git as fileserver
apt-get install salt-master -y
apt-get install salt-minion -y
apt-get install python-git -y

#setting the git config for the master
cp /etc/salt/master /etc/salt/master.old
echo -e \
"fileserver_backend: \n\
  - git \n\
\n\
gitfs_remotes:\n\
  - https://github.com/atmino/gamix.git\n\
\n\
runners_dir:\n\
  - salt://runners" > /etc/salt/master

#setting own ip as master in the minion config
cp /etc/salt/minion /etc/salt/minion.old
echo -e "master: $(hostname)" > /etc/salt/minion

#setting up the reactor config
mkdir /etc/salt/master.d
touch /etc/salt/master.d/reactor.conf

echo -e "reactor:\n\
  - 'salt/auth':\n\
    - /reactor/auth-pending.sls\n\
\n\
  - 'salt/minion/*/start':\n\
    - /reactor/auth-complete.sls\n\
\n\
  - 'nagios/send_info':\n\
    - /reactor/monitor.sls\n " > /etc/salt/master.d/reactor.conf

systemctl restart salt-minion
systemctl restart salt-master  

#accept itself as minion, salt will manage the rest from here
salt-key -a $(hostname) -y