
base:
  '*':
    - docker.install
    - docker.mine
    - nagios.client
    - logging.common
    - motd
    - docker.worker.join
  '*salt*':
    - nagios.server
    - runners
    - logging.server
    - docker.manager.first
    - docker.manager.join