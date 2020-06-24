How can we check that our container is still running?..

With docker ps, just like the UNIX ps command, lists running processes.
`docker ps`{{execute}}

Docker tells us:
- The (truncated) ID of our container.
- The image used to start the container.
- That our container has been running (Up) for a couple of minutes.


## Useful Commands
- Use the -l ("Last") to list last container that was started `docker ps -l`{{execute}}
- Use the -q ("Quiet", "Quick") to list only the IDs of our containers `docker ps -q`{{execute}}
- We can combine -l and -q to see only the ID of the last container started: `docker ps -lq`{{execute}}