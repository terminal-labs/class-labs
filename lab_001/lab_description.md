# Create multiple lines

Line #2 of the 'lab_001/problem/forloop1.sls' file uses jinja to assign a list of strings to the variable 'values'. Then there exists a salt state, 'create_multiple_lines', that calls salt's cmd.run module to be used for executing shell commands. The module cmd.run will execute any number of shell commands listed under 'names'. One incomplete command is provided:   

   - echo 'the value is '

## Assignment

Expand the salt state with a jinja 'for-loop' that loops through the list of assigned values and creates new lines, ie. shell commands, for cmd.run to execute. The commands should appear as follows:

   - echo 'the value is <value>'
