# Orch file
`lab_008/problem/groceries.sls` will be placed in `/srv/pillar/groceries.sls`, `lab_008/problem/multiple_lines.sls` will be placed in `/srv/salt/multiple_lines.sls`, and `lab_008/problem/multiple_states.sls` will be placed in `/srv/salt/multiple_states.sls`. There should be a local minion set up on your salt master machine with the id `local-minion`.

All of the previous assignments involved working within one salt state file. But very often you will need to execute multiple salt state files together. Orchestration files allow us to do just that. Orchestration files are placed in the `srv/salt/orch` directory and execute salt state files as orch states similarly to how a salt state file executes salt states. 

One orch file may have many orch states and a basic orch state is structured as follows:
```YAML
id:
  salt.state:
    - tgt: 'minion_group'
    - sls: 'salt_state_file'
```
`id` is the name of the orch state, `salt.state` tells salt to execute a salt state file, `- tgt: 'minion_group'` declares which minions will execute the salt states, and `- sls: 'salt_state_file` specifies which salt state file to execute. Our first orch state looks like this:
```YAML
multiple_lines_orch_state:
  salt.state:
    - tgt: 'local-minion'
    - sls: multiple_lines
```
`multiple_lines_orch_state` is the name of the orch state, `salt.state` indicates that we'll be running a salt state file, `- tgt: 'local-minion'` specifies the 'local-minion' on our salt master machine, and `- sls: multiple_lines` indicates the salt state file we'll be running.

NOTE: `- sls: multiple_lines` indicates `multiple_lines.sls` is a direct child of the `file_root`: `/srv/salt`. If hypothetically our `multiple_lines.sls` file was contained in a package named `multiple` in the following file system:
```BASH
├── srv
   └── salt
       ├── multiple
       │   ├── files
       │   │   └── variables.yaml
       │   └── multiple_lines.sls
       └── orch
           └── multi.sls
```
Then the path to `multiple_lines.sls` in the `sls:` argument would read `- sls: multiple.multiple_lines`. The file type `.sls` is never required when referencing packages or salt state files within an orch state and dot notation is used for the path. 

## Assignment

Create an orchestration file named `multiple.sls` containing 2 orch states that run the included salt state files with `local-minion`. Remember to place the orch state file `multiple.sls` within the `/srv/salt/orch` directory to indicate to salt that it is an orch state file. The first orch state was provided above. Write a second orch state for `local-minion` to execute the other salt state file `multiple_states.sls` we provided to you. Add a requisite to the second orch state that requires the first to be run as a prerequisite.


### Tip
- `multiple.sls` needs to be placed in the `/srv/salt/orch` directory for salt to recognize it as an orch state file. An acceptable file system for this assignment is:
```BASH
├── srv
   └── salt
       ├── multiple_lines.sls
       ├── multiple_states.sls
       ├── orch
       │   └── multiple.sls
       └── pillar
           └── groceries.sls
```
- Orch states can be appended with requisites to choreograph their execution. A common pattern that makes one orch state dependent on the completion of another is:
```YAML
id:
  salt.state:
    - tgt: <minion_group>
    - sls: <salt_state_file>
    - require:
      - salt: <id_of_required_orch_state>
```
- You can run your orch state file with the following command:
```BASH
salt-run state.orch orch.services
```

