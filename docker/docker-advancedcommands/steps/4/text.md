In this step, we will run multiple containers of the same image.

# Task 
Let's start two more containers.
`docker run -d jpetazzo/clock`{{execute}}
> Container_ID

`docker run -d jpetazzo/clock`{{execute}}
> Container_ID

Check that `docker ps`{{execute}} correctly reports all containers.