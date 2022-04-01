# file: /srv/salt/multiple_states.sls

{% for value in pillar.groceries %}
create_{{ value }}_state:
  cmd.run:
    - name: echo 'the value is {{ value }}'
{% endfor %}
