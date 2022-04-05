# Map file variables
`lab_006/problem/map1.sls` will be placed in `/srv/salt/map1.sls` on your master's file system. Up until now we've only imported variables from pillar files like `/srv/pillar/groceries.sls` which we've provided for you again here. However, sometimes its wise to keep variable files (or map files) contained within a package on a file system in the following way:
```BASH
.
└── package_name
    ├── map1.sls
    └── files
        └── variables.yaml
```
In this scenario, `map1.sls` is the salt state file that will be importing variables from `variables.yaml`. In this exercise we will transorm our `/srv/pillar/groceries.sls` pillar file into a `variables.yaml` file located in a `files/` directory which will be the sister of our `/srv/salt/map1.sls` salt state file. For the purpose of this lab, using the `srv/salt/` root directory as your package head is sufficient. So your file system may look like:
```BASH
├── srv
│   └── salt
│       ├── files
│       │   └── variables.yaml
│       └── map1.sls
```
The provided `/srv/pillar/groceries.sls` pillar file is structured like so:
```YAML
# file: /srv/pillar/groceries.sls

cart:
  - cupcake
  - chocolate
  - buns
```
Lets duplicate this in variables.yaml:
```YAML
# file: /files/variables.yaml

cart:
  - cupcake
  - chocolate
  - buns
```
Salt has the logic to import pillar files built-in and therefore it was not necessary to specify where we were importing the variables from in the previous examples. However, this time we need to specify where and how we're importing variables with the following JINJA:
```JINJA
{% import_yaml 'files/variables.yaml' as groceries %}
```
`import_yaml` indicates the format of the data we're importing, `'files/variables.yaml'` is a relative path to the location of that data, and `groceries` sets the variable name of the imported dataset. 

Now that we've imported the variables we can loop through them using JINJA like before:
```JINJA
{% for c in groceries['cart'] %}
YAML
{% endfor %}
```
NOTE: We are representing our data with the following YAML structure:
```YAML
cart:
  - cupcake
  - chocolate
  - buns
```
which translates to JSON in the following way:
```PYTHON
{
  'cart': [
      'cupcake',
      'chocolate',
      'buns'
  ]
}
```


## Assignment

Transform the provided `/srv/salt/groceries.sls` pillar file into a map file named `variables.yaml` contained within a `files` directory, ie `files/variables.yaml` and replace the provided JINJA logic with logic for looping through a map file:
```JINJA
{% for c in groceries['cart'] %}
YAML
{% endfor %}
```


### Tip
- Remember to declare your imports using the following syntax:
```JINJA
{% import_yaml '<relative_path_to_file>' as <variable_name> %}
```
- The data in the map file, `/srv/salt/files/variables.yaml` is a YAML formatted dictionary. YAML is derived from JSON.
```YAML
cart:
  - cupcake
  - chocolate
  - buns
```
is equivalent to the JSON:
```PYTHON
{
  'cart': [
      'cupcake',
      'chocolate',
      'buns'
  ]
}
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
create_multiple_lines:
  cmd.run:
    - names:
      - echo 'the value is cupcake'
      - echo 'the value is chocolate'
      - echo 'the value is buns'
 ```
