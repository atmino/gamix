{% set ip_of_ens3 = salt['network.ip_addrs']('ens3')[0] %}

install-nagios-client:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-server
      - nagios-plugins

nagios-nrpe-server:
  service.running: []

nagios/send_info:
  event.send:
    - kwargs:
      - ip: {{ ip_of_ens3 }}