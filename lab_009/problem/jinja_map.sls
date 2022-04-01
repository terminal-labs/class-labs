# file: /srv/salt/map1.sls
{% import_yaml 'files/variables.yaml' as groceries %}

create_grocery_list:
  file.managed:
    - name: lab_008/solution/grocery_list.conf
    - source: salt://lab_008/problem/grocery_list.conf

