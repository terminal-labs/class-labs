# file: /srv/salt/forloop1.sls
{% set values = ['apple', 'orange', 'steak'] %}

create_multiple_lines:
  cmd.run:
    - names:
{% for value in values %}
      - echo 'the value is {{ value }}'
{% endfor %}
