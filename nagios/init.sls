#install nagioscore and plugins

use-script-to-install:
  cmd.script:
    - source: salt://nagios/installing-script.sh
    - creates: /usr/local/nagios
