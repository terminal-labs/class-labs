# file: /srv/salt/pillarvalue1.sls

create_multiple_lines:
  cmd.run:
    - names:
{% for value in pillar['groceries'] %}
      - echo "the value is: {{ value }}'
{% endfor %}
