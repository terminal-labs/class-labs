# Pillar file

The previous examples used jinja to assign a list of strings to a variable. In this example, the list of strings exists in a separate pillar file which needs to be made avaiable to the salt state with a corresponding top.sls file (not included). We then have the same salt state as was provided in the previous assignments with the intention of executing the following shell command:

   - echo 'the value is <value>'

## Assignment

Create a top file that makes the list of groceries in the included pillar file available to the salt state file 'pillarvalue1.sls'. Then use a jinja 'for-loop' to create multiple lines, i.e. additional shell commands, for module cmd.run to execute just like in the first assignment. 
