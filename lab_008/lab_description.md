# Orch file

All of the previous assignments involved working within one salt state file. But very often you will need to execute multiple salt state files together. Orchestration files allow us to do just that. Orchestration files execute salt state files similarly to how a salt state file executes individual salt states.

## Assignment

The 'lab_007/problem' directory contains a pillar file and 2 separate salt state files, 'multiple_lines.sls' and 'multiple_states.sls'. Create an orchestration file named 'orch.sls' containing the two salt state files as 'orch states' to be executed by a minion with id: 'local-minion'. Furthermore, create the orchestration file in such a way that requires the multiple_lines.sls file to be executed as a requirement before the multiple_states.sls file can be run. For this you'll have to include at least one requisite on your 'multiple_states' orch state. 
