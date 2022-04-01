# Exporting jinja variables

Jinja can also be used to allow salt states to insert variables directly into other files with the help of the files.managed module. This comes up a lot when automating the editing of configuration and service files for various administrative tasks. The 'lab_008/problem' directory contains a file, 'grocery_list.conf' with jinja variables, ie {{ item1 }}, {{ item2 }}, etc., in place of grocery items. Those grocery items are defined in 'groceries.yaml'. 

## Assignment

The salt state provided in 'jinja_map.sls' is incomplete. It tells salt to move the file in its current form from the 'lab_008/problem' directory to the 'lab_008/solution' directory. However, we also need salt to insert the variables defined in 'groceries.yaml' into their jinja placeholders, ie {{ item1 }}, {{ item2 }}, and {{ item3 }} in the 'grocery_list.conf' file. Append the provided salt state with the proper logic to map the variables into the 'grocery_list.conf' file. 
