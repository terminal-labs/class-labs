# file: /srv/salt/forloop1.sls
{% set values = ['apple', 'orange', 'steak'] %}

create_multiple_lines:
  cmd.run:
    - names:
      - echo 'the value is '
