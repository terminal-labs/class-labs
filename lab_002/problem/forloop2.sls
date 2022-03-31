# file: /srv/salt/forloop2.sls
{% set values = ['apple', 'orange', 'steak'] %}

create_multiple_states:
  cmd.run:
    - name: echo 'the value is '
