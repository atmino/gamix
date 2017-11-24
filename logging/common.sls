#setup logging via salt

rsyslog:
  pkg.installed:
    - name: rsyslog


send-logs:
  cmd.run:
    - name: echo "*.*       @@10.5.1.60:514" >> /etc/rsyslog.conf

rsyslog-service:
  service.running:
    - name: rsyslog
    - enable: true
    - watch:
      - file: /etc/rsyslog.conf
