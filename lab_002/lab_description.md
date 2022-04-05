# Create multiple states with jinja loop
`lab_002/problem/forloop2.sls` will be placed in `/srv/salt/forloop2.sls` on your master's file system.

Our partially completed salt state, `create_multiple_states`, is identical to the previous example in every way except for the `id`. Refer to `lab_001/lab_description.md` for a breakdown of its component parts. 
```JINJA
{% set values = ['apple', 'orange', 'steak'] %}
```
```YAML
create_multiple_states:
  cmd.run:
    - names:
       - echo 'the value is '
```

NOTE: The `cmd.run` command is executing whatever value `name` or `names` is given as a bash/sh command in the minion server's shell.


## Assignment
Create a new salt state for each assigned value in the provided list with a jinja for-loop. In the last assignment, the for-loop encapsulated only the echo line of the salt state. This time the for-loop will encapsulate the entire salt state.
```YAML
<salt_state_id>:
  cmd.run:
    - names:
       - echo 'the value is <value>'
```

### Tip
- Every state in a salt state file must have a unique id. If multiple states are produced with the same id, salt will fail and throw an error. In other words, the following example will produce an error because the JINJA for-loop will produce multiple states with the same id.
```JINJA
{% set values = ['a', 'b', 'c'] %}

{% for value in values %}
salt_state_id:
  cmd.run:
    - names:
      - echo {{ value }}
{% endfor %}
```
- To test your salt state without actual execution you can run either or both commands, but be aware they don't do the exact same thing and can return different results.
```BASH
$ salt \* state.apply forloop2 test=true --out=yaml
or
$ salt \* slsutil.renderer /srv/salt/forloop2.sls --out=yaml
```

### Output
The final output should populate something to the effect of:
```YAML
<salt_state_id>:
  cmd.run:
    - names:
      - echo 'the value is apple'

<salt_state_id>:
  cmd.run:
    - names:
      - echo 'the value is orange'
     
<salt_state_id>:
  cmd.run:
    - names:
      - echo 'the value is steak'
```
