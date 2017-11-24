include:
- logging.common

receive-tcpudp:
  cmd.run:
    - name: sed -i -e 's/#module(load="imudp")/module(load="imudp")/'\
            -e 's/#input(type="imudp" port="514")/input(type="imudp" port="514")/'\
            -e 's/#module(load="imtcp")/module(load="imtcp")/'\
            -e 's/#input(type="imtcp" port="514")/input(type="imtcp" port="514")/'\
            /etc/rsyslog.conf
    - onchanges:
      - pkg: rsyslog