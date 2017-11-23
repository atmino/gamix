#watch file, make py executable

manage_runner_file:
  file.managed:
    - name: /etc/salt/runners/cp_cfg.py
    - source:
      - salt://runners/cp_cfg.py
    - mode: 775