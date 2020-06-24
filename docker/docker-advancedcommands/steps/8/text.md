There are two ways we can terminate our detached container.
- Killing it using the docker kill command (stops immediately).
- Stopping it using the docker stop command (10 seconds delay).

## Stop
Let's stop one of the containers:
`docker stop mycontainer`{{execute}}

## Kill
Let's be less patient with the other containers:
`docker kill $(docker ps -q)`{{execute}}

> Above command will print IDs of terminated container(s)
>
> 13e1e0042b1c
>
> 78e1e0042b1d

The stop and kill commands can take multiple container IDs.

**Note:** Let's check that our containers don't show up anymore by running: `docker ps`{{execute}}