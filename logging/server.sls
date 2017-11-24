include:
- logging.common


setup-server-config:
  service.running:
    - name: rsyslog
    - enable: true
    - watch:
      - file: /etc/rsyslog.conf
  file.managed:
    - name: /etc/rsyslog.conf
    - source: salt://logging.server-config.conf