# file: /srv/salt/pillarvalue2.sls

create_multiple_lines_groceries:
  cmd.run:
    - names:
{% for value in salt['pillar.get']('groceries', ['a','b','c']) %}
      - echo 'the value is {{ value }}'
{% endfor %}

create_multiple_lines_party_favors:
  cmd.run:
    - names:
{% for value in salt['pillar.get']('party_favors', ['a','b','c']) %}
      - echo 'the value is {{ value }}'
{% endfor %}
