{% set join_token = salt.saltutil.runner('mine.get', tgt='*', fun='manager_token') %}
{% set join_ip = salt.saltutil.runner('mine.get', tgt='*', fun='manager_ip') %}

include:
  - docker.init
  - docker.mine

join cluster:
  cmd.run:
    - name: 'docker swarm join --token {{ join_token }} {{ join_ip }}:2377
    - require:
      - pkg: docker-ce