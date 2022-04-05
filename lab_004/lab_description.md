# Multiple pillar files
`lab_004/problem/pillarvalue2.sls` will be placed in `/srv/salt/pillarvalue2.sls`, `lab_004/problem/groceries.sls` will be placed in `/srv/pillar/groceries.sls`, and `lab_004/problem/party_favors.sls` will be placed in `/srv/pillar/party_favors.sls` on your master's file system. 

The previous assignment required you to import and loop through the variables contained in one pillar file `/srv/pillar/groceries.sls`. However, you're very often required to import variables from multiple pillar files. In this example, there are 2 pillar files and 1 incomplete salt state file provided to you.
```YAML
# file: /srv/pillar/groceries.sls

groceries:
  - cupcake
  - chocolate
  - buns
```
```YAML
# file: /srv/pillar/party_favors.sls

party_favors:
  - balloons
  - face_paint
  - shin_guards
```
The pillar data needs to be made accessable to your salt state with a corresponding `top.sls` file which is not provided for you. A basic `top.sls` file is structured like so:
```YAML
base:
  '*':
    - packages
```
NOTE: In this case the `top.sls` file will be referencing 2 packages (or salt state files). 


Two partially completed salt states are provided for you in `/srv/salt/pillarvalue2.sls`:
```YAML
# file: /srv/salt/pillarvalue2.sls

create_multiple_lines_groceries:
  cmd.run:
    - names:

create_multiple_lines_party_favors:
  cmd.run:
    - names:
```

## Assignment
Expand the salt states with jinja for-loop's that loop through the pillar data in `/srv/pillar/groceries.sls` and `/srv/pillar/party_favors.sls` creating new lines. The for-loop's will only encapsulate the echo lines of the salt states and will have an added jinja variable as part of the echo line.
```YAML
   - echo "the value is {{ value }}"
```

### Tip
- Because our pillar files `/srv/pillar/groceries.sls` and `/srv/pillar/party_favors.sls` are direct children of `srv/pillar/`, salt already knows exactly where to look for them. No other file system specification is necessary.  
- The data in the pillar file, `/srv/pillar/groceries.sls` is a YAML formatted dictionary. YAML is derived from JSON.
```YAML
groceries:
  - cupcake
  - chocolate
  - buns
```
is equivalent to JSON:
```PYTHON
{
  'groceries': [
      'cupcake',
      'chocolate',
      'buns'
  ]
}
```
- `groceries` can be imported as a pillar variable into an sls file using the syntax `pillar['groceries']`
- `party_favors` can be imported as a pillar variable into an sls file using the syntax `pillar['party_favors']`
- To check what pillar data is available to a minion you can run the command:
```BASH
$ salt '<minion-id>' pillar.items
```
- To check what pillar data is available to all minions you can run the command:
```BASH
$ salt \* pillar.items
```
- To test your salt state without actual execution you can run either or both commands, but be aware they don't do the exact same thing and can return different results.
```BASH
$ salt \* state.apply forloop1 test=true --out=yaml
or
$ salt \* slsutil.renderer /srv/salt/forloop1.sls --out=yaml
```

### Output
The final output should populate something to the effect of:
```YAML
create_multiple_lines_groceries:
  cmd.run:
    - names:
      - echo 'the value is cupcake'
      - echo 'the value is chocolate'
      - echo 'the value is buns'
      
create_multiple_lines_party_favors:
  cmd.run:
    - names:
      - echo 'the value is balloons'
      - echo 'the value is face_paint'
      - echo 'the value is shin_guards'
```
