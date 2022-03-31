# Create multiple states

Line #2 of the 'lab_002/problem/forloop2.sls' file uses jinja to assign a list of strings to the variable 'values'. Then there exists a salt state, 'create_multiple_states', that calls salt's cmd.run module to be used for executing shell commands. The module cmd.run will execute any number of shell commands listed under 'names'. One incomplete command is provided:    

   - echo 'the value is '

## Assignment

In the last assignment we created a jinja 'for-loop' to create additional lines, i.e. additional shell commands, for module cmd.run to execute. For this assignment, create a jinja 'for-loop' that generates additional salt STATES for each assigned value with the same purpose of executing the shell command:

   - echo 'the value is <value>'

