# file: /srv/salt/pillarvalue2.sls

create_multiple_lines_groceries:
  cmd.run:
    - names:
{% for value in salt['groceries'] %}
      - echo 'the value is {{ value }}'
{% endfor %}

create_multiple_lines_party_favors:
  cmd.run:
    - names:
{% for value in salt['party_favors'] %}
      - echo 'the value is {{ value }}'
{% endfor %}
