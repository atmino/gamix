{% set join_token = salt.saltutil.runner('mine.get', tgt='*', fun='worker_token', tgt_type='nodegroup') %}
{% set join_ip = salt.saltutil.runner('mine.get', tgt='*', fun='manager_ip', tgt_type='nodegroup') %}

include:
  - docker.init

join cluster:
  cmd.run:
    - name: 'docker swarm join --token {{ join_token }} {{ join_ip }}:2377