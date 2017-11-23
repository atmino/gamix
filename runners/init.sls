#watch file, make py executable

manage-config-python:
  file.managed:
    - name: /etc/salt/runners/cp_cfg.py
    - source: salt://runners/cp_cfg.py
    - mode: 775
    - makedirs: True