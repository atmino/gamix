install-nagios-client:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-server
      - nagios-plugins
  service.running:
    - name: nagios-nrpe-server
    - require:
      - pkg: nagios-nrpe-server