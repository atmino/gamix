#install nagioscore and plugins

use-script-to-install:
  cmd.script:
    - source: salt://nagios/installing-script.sh
    - creates: /usr/local/nagios

nagios-nrpe-server.service:
  service.running: []
  
nagios.service:
  service.running: []