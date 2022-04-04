# file: /srv/salt/arguments.sls
{% set values = ['apple', 'orange', 'steak'] %}

create_multiple_lines:
  cmd.run:
    - shell: /bin/bash
    - cwd: /home/ubuntu
    - names:
      - echo "bash version: ${BASH_VERSION}" > test.txt
{% for value in values %}
      - echo 'the value is {{ value }}'
{% endfor %}
