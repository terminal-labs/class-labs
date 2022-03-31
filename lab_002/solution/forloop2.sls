# file: /srv/salt/forloop2.sls
{% set values = ['apple', 'orange', 'steak'] %}

{% for value in values %}
create_{{ value }}_state:
  cmd.run:
    - name: echo 'the value is {{ value }}'
{% endfor %}
