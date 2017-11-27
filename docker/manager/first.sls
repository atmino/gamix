include:
  - docker.init
  - docker.mine

init new docker swarm:
  cmd.run:
    - name: 'docker swarm init'
    - require:
      - pkg: docker-ce