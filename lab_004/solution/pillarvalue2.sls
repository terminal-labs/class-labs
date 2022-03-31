# file: /srv/salt/pillarvalue2.sls

create_multiple_lines:
  cmd.run:
    - names:
{% for value in salt['pillar.get']('groceries', ['a','b','c']) %}
      - echo 'the value is {{ value }}'
{% endfor %}
