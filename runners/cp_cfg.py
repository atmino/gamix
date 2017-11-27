#!/usr/bin/python
from shutil import copyfile
import fileinput
import os

def copy_config(id, ip):
	restart = "bash -c 'systemctl restart nagios.service'"
	ipaddress = "ipaddress"
	minion = "minion"
	old_file = "/usr/local/nagios/etc/servers/host.template"
	new_file = "/usr/local/nagios/etc/servers/"
	new_file += id
	new_file += ".cfg"

	if not os.path.exists(new_file):
		copyfile(old_file, new_file)
		for line in fileinput.input(new_file, inplace=True):
			print line.replace(minion, id),
		for line in fileinput.input(new_file, inplace=True):
			print line.replace(ipaddress, ip),
		os.system(restart)
	else:
		print "config exists, exiting"
	return