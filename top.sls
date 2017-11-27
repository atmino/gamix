
base:
  '*':
    - docker.install
    - docker.worker.join
    - docker.mine
    - nagios.client
    - logging.common
    - motd
  '*salt*':
    - nagios.server
    - runners
    - logging.server
    - docker.manager.first
    - docker.manager.join