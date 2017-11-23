#!/usr/bin/python
from shutil import copyfile
import fileinput

def copy_config(id, ip):
	ipaddress = "ipaddress"
	minion = "minion"
	host_dir = "/usr/local/nagios/etc/servers/"
	host_dir += id
	host_dir += ".cfg"
	copyfile(/usr/local/nagios/etc/servers/host.template, host_dir)
	print "config file copied!"
	
	with fileinput.FileInput(host_dir, inplace=True, backup='.bak') as file:
		for line in file:
			print(line.replace(ipaddress, ip), end='')
	print "configured ip address"
	
	with fileinput.FileInput(host_dir, inplace=True, backup='.bak') as file:
		for line in file:
			print(line.replace(minion, id), end='')
	print "configured hostname"
	print "config complete, exiting"
	return