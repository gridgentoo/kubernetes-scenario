Containers can be started in the background, with the -d flag:

`docker run -d  --name=mycontainer jpetazzo/clock`{{execute}}

- We don't see the output of the container.
- But don't worry: Docker collects that output and logs it!
- Docker gives us the ID of the container.