# Multiple arguments
`lab_007/problem/arguments.sls` will be placed in `/srv/salt/arguments.sls`. Up until now we've only used the cmd.run module with one salt state argument `name` or `names`. The basic structure of our salt states has been:
```YAML
<state_id>:
  cmd.run:
    - names:
      - <command_1>
      - <command_2>
```
But salt states often include multiple arguments:
```YAML
<state_id>:
  cmd.run:
    - <argument_1>
    - <argument_2>
    - names:
      - <command_1>
      - <command_2>
```
One such argument for `cmd.run` is `shell`. `shell` tells `cmd.run` what language to execute shell commands in by providing the location of their binary files. Possible values for `shell` include `/bin/sh`, `/bin/zsh`, or `/bin/bash`. 

Another such argument is `cwd`. `cwd` tells `cmd.run` where to execute our shell commands. Since salt always acts as the root user when executing salt states, any directory that exists on our minion's machine can be used as a value, ie `/home/ubuntu`, `home/root`, or `/etc/salt/minion.d`.

In this exercise you'll be expanding the following salt state you wrote in a previous lab with 2 additional arguments:
```
# file: /srv/salt/arguments.sls
{% set values = ['apple', 'orange', 'steak'] %}

create_multiple_lines:
  cmd.run:
    - <argument_1>: <value_1>
    - <argument_2>: <value_2>
    - names:
      - <additional_test_command>
{% for value in values %}
      - echo 'the value is {{ value }}'
{% endfor %}
```


## Assignment

Add two arguments to the provided salt state. The first argument will instruct the cmd.run module to use the bash language to execute shell commands. The second argument will specify the working directory to execute the bash commands inside, `/home/ubuntu`. Add an additional command under `names` to test that cmd.run is indeed executing commands in the `/home/ubuntu` directory. You can use a command like `echo "bash version: ${BASH_VERSION}" > test.txt` to create a test file on your minion's file system in your specified current working directory `/home/ubuntu`  and your bash version as its content.


### Output
Your salt state should create a `test.txt` file on the minion's file system with the following path:
```BASH
├── home
│   └── ubuntu
│       └── test.txt
```
The filepath of `test.txt` will indicate that the `cwd` argument was carried out successfully and the content of `test.txt` should indicate that the `shell` argument was carried out successfully. 

