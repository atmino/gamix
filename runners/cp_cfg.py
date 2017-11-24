#!/usr/bin/python
from shutil import copyfile
import fileinput
import os

def copy_config(id, ip):
	restart = "bash -c 'systemctl restart nagios.service'"
	ipaddress = "ipaddress"
	minion = "minion"
	old_file = "/usr/local/nagios/etc/servers/host.template"
	host_dir = "/usr/local/nagios/etc/servers/"
	host_dir += id
	host_dir += ".cfg"
	copyfile(old_file, host_dir)
	print "config file copied!"
	
	for line in fileinput.input(host_dir, inplace=True):
		print line.replace(minion, id),
	print "hostname configured"
	
	for line in fileinput.input(host_dir, inplace=True):
		print line.replace(ipaddress, ip),
	print "ip configured"
	
	print "config complete, restarting nagios"
	
	os.system(restart)
	
	print "nagios restarted"
	
	return