#setup logging via salt

rsyslog:
  pkg.installed:
    - name: rsyslog

rsyslog-service:
  service.running:
    - name: rsyslog
    - enable: true
    - watch:
      - file: /etc/rsyslog.conf
  file.managed:
    - name: /etc/rsyslog.conf
    - source: salt://logging/rsyslog.conf
