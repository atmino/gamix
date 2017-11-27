include:
  - docker.install
  - docker.mine

init new docker swarm:
  cmd.run:
    - name: 'docker swarm init'