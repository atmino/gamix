
figlet:
  pkg.installed: []

boxes:
  pkg.installed: []
  
kill-old-processes:
  service.dead:
    - name: motd
    - enable: False


make-motd-dir:
  file.directory:
    - name: /etc/update-motd.d
    - makedirs: True

add-motd:
  file.managed:
    - name: /etc/update-motd.d/10-artsy-hello
    - source: salt://motd/10-artsy-hello
    - mode: 775

