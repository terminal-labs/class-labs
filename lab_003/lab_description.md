# Pillar file variables
`lab_003/problem/pillarvalue1.sls` will be placed in `/srv/salt/pillarvalue1.sls` and `lab_003/problem/groceries.sls` will be placed in `/srv/pillar/groceries.sls` on your master's file system. 

The previous examples used the jinja `set` command to assign a list of strings to a variable. In this example, the list of strings exists in a separate pillar file `/srv/pillar/groceries.sls` formatted in YAML. 
```YAML
# file: /srv/pillar/groceries.sls

groceries:
  - cupcake
  - chocolate
  - buns
```

The pillar data needs to be made accessable to your salt state with a corresponding `top.sls` file which is not provided for you. A basic `top.sls` file is structured like so:
```YAML
base:
  '*':
    - packages
```
`base` stands for base environment and is the environment in which this data will be made available. Examples of other environments could be `dev` or `test`. `'*'` specifies which minions will be able to access the data; all have access in this example as denoted by `'*'`. Minion id's, ie `local-minion`, or minion types described by grains, ie `'os:Debian'` could also be used here. `-packages` describes the salt state files (or package directories if structured correctly in the file system) that will be made accessable to those declared minions.
You may visit https://docs.saltproject.io/en/latest/topics/best_practices.html for best practices on structuring pillar files. 


The same partially completed salt state from `lab-001/problem/forloop1.sls` is provided for you:
```YAML
create_pillar_multi_line:
  cmd.run:
    - names:
      - echo 'the value is: '
```

## Assignment
Expand the salt state with a jinja for-loop that loops through the pillar data in `/srv/pillar/groceries.sls` and creates new lines. The for-loop will only encapsulate the echo line of the salt state and will have an added jinja variable as part of that line.
```YAML
   - echo "the value is {{ value }}"
```

### Tip
- Because our pillar file `/srv/pillar/groceries.sls` is a direct child of `srv/pillar/`, salt already knows exactly where to look. No other file system specification is necessary.  
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
create_pillar_multi_line:
  cmd.run:
    - names:
      - echo 'the value is cupcake'
      - echo 'the value is chocolate'
      - echo 'the value is buns'
```
