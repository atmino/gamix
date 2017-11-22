{% if 'act' in data and data['act'] == 'pend' %}
minion_add:
  wheel.key.accept:
    - args:
      - match: {{ data['id'] }}
{% endif %}