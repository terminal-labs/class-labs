# Create multiple lines in a single state
`lab_001/problem/forloop1.sls` will be placed in `/srv/salt/forloop1.sls` on your master's files system.

When looking at the partially completed salt state, we have a jinja `set` command used for a list of variables assigned to `values`. While this variable is set in jinja, currently it is not populating anything in the state file with the yaml.
```JINJA
{% set values = ['apple', 'orange', 'steak'] %}
```

The salt state `create_multiple_lines` is almost completed. It has an `id`, `module.function` selected, and has the `names` key indented, with a semi-functional list value.
```YAML
create_multiple_lines:
  cmd.run:
    - names:
       - echo 'the value is '
```

NOTE: The cmd.run command is executing whatever value `name` or `names` is given as a bash/sh command in the minion's server's shell.


## Assignment
Expand the salt state with a jinja for loop that loops through the list of assigned values and creates new lines. The for loop will only encapsulate the echo line of the salt state and will have an added jinja variable as part of the echo line.
```YAML
   - echo 'the value is '
```

### Tip
- a jinja variable is referenced with double curly braces: `{{ VARIABLE }}`
- A jinja for loop has the basic structure:
```JINJA
{% for VARIABLE in VARIABLE %}
YAML
{% endfor %}
```
- to test your salt state you can run either or both commands, but be aware they dont do the exact same thing and can get different results from the two commands.
```BASH
$ salt \* state.apply forloop1 test=true --out=yaml
or
$ salt \* slsutil.renderer /srv/salt/forloop1.sls --out=yaml
```

### Output
The final output should populate something to the effect of:
```YAML
create_multiple_lines:
  cmd.run:
    - names:
      - echo 'the value is apple'
      - echo 'the value is orange'
      - echo 'the value is steak'
```
