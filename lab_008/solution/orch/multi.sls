# File:/srv/salt/orch/multi.sls

multiple_lines_orch_state:
  salt.state:
    - tgt: 'local-minion'
    - sls: multiple_lines

multiple_states_orch_state:
  salt.state:
    - tgt: 'local-minion'
    - sls: multiple_states
    - require:
      - salt: multiple_lines_orch_state
      
