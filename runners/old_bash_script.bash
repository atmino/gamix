#!/bin/bash

HOST=$1
IP=$2

cp /usr/local/nagios/etc/servers/host.template /usr/local/nagios/etc/servers/$HOST.cfg
sed -i 's|minion|'$HOST'|g' /usr/local/nagios/etc/servers/$HOST.cfg
sed -i 's|ipaddress|'$IP'|g' /usr/local/nagios/etc/servers/$HOST.cfg
service nagios restart