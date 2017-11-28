
base:
  '*':
    - motd
    - nagios.client
    - logging.common
    - docker.install
  '*salt*':
    - runners
    - nagios.server
    - logging.server
    - docker.mine