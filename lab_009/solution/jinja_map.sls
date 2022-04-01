# file: /srv/salt/map1.sls
{% import_yaml 'files/variables.yaml' as groceries %}

create_grocery_list:
  file.managed:
    - name: lab_008/solution/grocery_list.conf
    - source: salt://lab_008/problem/grocery_list.conf
    - template: jinja
    - defaults:
      item1: {{ groceries.item1 }}
      item2: {{ groceries.item2 }}
      item3: {{ groceries.item3 }}
