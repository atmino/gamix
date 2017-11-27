{% set join_token = salt.saltutil.runner('mine.get', tgt='*', fun='manager_token') %}
{% set join_ip = salt.saltutil.runner('mine.get', tgt='*', fun='manager_ip') %}

include:
  - docker.install
  - docker.mine

join cluster as manager:
  cmd.run:
    - name: docker swarm join --token {{ join_token }} {{ join_ip }}:2377