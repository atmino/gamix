
base:
  '*':
    - docker
    - nagios.client
    - logging.common
  'salt':
    - nagios.server
    - runners
    - logging.server