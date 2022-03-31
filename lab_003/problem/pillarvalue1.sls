# file: /srv/salt/pillarvalue1.sls

create_pillar_multi_line:
  cmd.run:
    - names:
      - echo 'the value is: '
