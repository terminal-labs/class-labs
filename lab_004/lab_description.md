# Multiple pillar files

The last assignment required you to input and loop through the variables contained in one pillar file. Very often, you're required to input from multiple pillar files. There are 2 pillar files and 1 salt state file provided to you. The salt state file contains 2 separate incomplete salt states.

## Assignment

Create a top file that makes the list of groceries in the included pillar files available to the salt state file 'pillarvalue2.sls'. Then use jinja 'for-loop's to create multiple lines, i.e. additional shell commands, for module cmd.run to execute within the 'create_multiple_lines_groceries' and 'create_multiple_lines_party_favors' salt states similar to the previous assignment. 