As the container is created, now it's time to log into it.

First, we will verify that the container is currently running by executing:

`docker ps 
`{{execute}}

This command lists all the containers that are currently active.
Copy either the **CONTAINER ID** or **CONTAINER NAME** from the output of above command as we will need it for next command.

Now, it's time to log into it by executing:

`docker exec -it "CONTAINER ID/NAME" /bin/bash
`{{execute}}

Replace quoted string with actual value of either **CONTAINER ID/CONTAINER NAME**.

Now, we will be logged into our container as a ROOT user.