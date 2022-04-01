# file: /srv/salt/multiple_lines.sls

create_multiple_lines:
  cmd.run:
    - names:
{% for value in pillar.groceries %}
      - "echo 'the value is: {{ value }}'"
{% endfor %}
