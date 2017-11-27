
base:
  '*':
    - docker
    - nagios.client
    - logging.common
    - motd
  '*salt*':
    - nagios.server
    - runners
    - logging.server