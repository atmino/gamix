install-nagios-client:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-server
      - nagios-plugins

nagios-nrpe-server:
  service.running: []

