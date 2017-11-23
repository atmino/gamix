#watch file, make py executable

manage_runner_file:
  file.managed:
    - source:
      - salt://runners/cp_cfg.py
    - mode: 775