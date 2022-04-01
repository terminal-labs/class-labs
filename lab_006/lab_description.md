# Map file

So far we've only imported variables into our salt states using pillar files. There are other ways of importing data as well. One way is with the use of map files. Whereas pillar files have to be located under the declared pillar root, map files can be located anywhere. A pillar file and corresponding salt state file that loops through that pillar data is provided for you. 

## Assignment

Transform the pillar file into a map file (groceries.yaml) and replace the provided jinja logic with logic for looping through a map file.
