# file: /srv/salt/map1.sls
{% import_yaml 'files/groceries.yaml' as groceries %}

create_multiple_lines:
  cmd.run:
    - names:
{% for c in groceries['cart'] %}
      - echo 'the value is {{ c }}'
{% endfor %}
