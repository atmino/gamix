#install nagioscore and plugins

use-script-to-install:
  cmd.script:
    - source: salt://nagios/installing-script.sh
    - creates: /usr/local/nagios

manage-config-dir:
  file.directory:
    - name: /usr/local/nagios/etc/servers
    - makedirs: True

manage-template:
  file.managed:
    - name: /usr/local/nagios/etc/servers/host.template
    - source: salt://nagios/host.template

nagios-nrpe-server.service:
  service.running: []
  
nagios.service:
  service.running: []
