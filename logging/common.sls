#setup logging via salt

rsyslog:
  pkg.installed:
    - name: rsyslog

rsyslog-service:
  service.running:
    - enable: true
    - name: rsyslog

send-logs:
  cmd.run:
    - name: echo "*.*       @@10.5.1.60:514" >> /etc/rsyslog.conf
    - unless: cat /etc/rsyslog | grep '@@10.5.1.60:514'