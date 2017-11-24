config-nagios:
  runner.cp_cfg.copy_config:
    - args:
      - id: {{ data['id'] }}
      - ip: {{ data['data']['ip']['ip'] }}