# Pillar file variables - pillar.get
`lab_005/problem/pillarvalue3.sls` will be placed in `/srv/salt/pillarvalue3.sls` and `lab_005/problem/groceries.sls` will be placed in `/srv/pillar/groceries.sls` on your master's file system. 

The previous examples imported pillar data using the basic `pillar['variable']` method. There is another way of importing pillar data that automatically applies default values if no matching pillar data is found. As before, the pillar file `/srv/pillar/groceries.sls` is provided for you.
```YAML
# file: /srv/pillar/groceries.sls

list:
  - cupcake
  - chocolate
  - buns
```
We've seen how to loop through the pillar data with pillar['groceries']:
```JINJA
{% for value in pillar['groceries'] %}
YAML
{% endfor %}
```
To also include default fallback values for our pillar data we can loop through like so:
```JINJA
{% for value in salt['pillar.get']('groceries', ['a','b','c'] %}
YAML
{% endfor %}
```
NOTE: This will loop through the pillar data as before with the caveat that if pillar data is absent, variable ['a', 'b', 'c'] will be used as the default. 

As before, the pillar data needs to be made accessable to your salt state with a corresponding `top.sls` file which is not provided for you. A basic `top.sls` file is structured like so:
```YAML
base:
  '*':
    - packages
```
The same partially completed salt state from `lab-003/problem/pillarvalue1.sls` is provided for you:
```YAML
create_multiple_lines:
  cmd.run:
    - names:
      - echo 'the value is: '
```

## Assignment
Expand the salt state with a jinja 'for loop' that loops through the pillar data in `/srv/pillar/groceries.sls` and creates new lines. Pillar data must be imported using the `salt['pillar.get']` method that allows for the inclusion of default values. The 'for loop' will only encapsulate the echo line of the salt state and will have an added jinja variable as part of the echo line. Perform 2 runs: the first run using the pillar file provided to you, and the second run with the pillar data deleted. 


### Tip
- Because our pillar file `/srv/pillar/groceries.sls` is a direct child of `srv/pillar/`, salt already knows exactly where to look. No other file system specification is necessary.  
- The data in the pillar file, `/srv/pillar/groceries.sls` is a YAML formatted dictionary. YAML is derived from JSON.
```YAML
list:
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
- `groceries` can be imported as a pillar variable into an sls file using the syntax `salt['pillar.get']('groceries', ['a', 'b', 'c'])` where `groceries` is the variable being imported and `['a', 'b', 'c']` is the default variable to use in the absence of pillar data.
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

Run 1)
```YAML
create_pillar_multi_line:
  cmd.run:
    - names:
      - echo 'the value is cupcake'
      - echo 'the value is chocolate'
      - echo 'the value is buns'
```

Run 2) 
```YAML
create_pillar_multi_line:
  cmd.run:
    - names:
      - echo 'the value is a'
      - echo 'the value is b'
      - echo 'the value is c'
```
