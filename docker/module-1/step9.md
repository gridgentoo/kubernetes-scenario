A container's filesystem is removed when it is deleted.

Let's see this in action:

1. Create a container: `docker run -d --name novolume alpine:latest sleep 1d`{{execute}}
2. Write a file: `docker exec novolume sh -c 'echo World > /root/hello'`{{execute}}
3. Print the file: `docker exec novolume cat /root/hello`{{execute}}
4. Remove the container: `docker stop novolume && docker rm novolume`{{execute}}
5. Create a new container: `docker run -d --name novolume alpine:latest sleep 1d`{{execute}}
6. Try to print the file: `docker exec novolume cat /root/hello`{{execute}}

Notice the file no longer exists. What if this was our database?

Docker provides a mechanism to mount volumes into containers, which will persist beyond the life of a container.

1. Create a volume: `docker volume create myvolume`{{execute}}
2. Create a container, and mount the volume: `docker run -d --name withvolume -v myvolume:/root alpine:latest sleep 1d`{{execute}}
3. Write a file: `docker exec withvolume sh -c 'echo World > /root/hello'`{{execute}}
4. Print the file: `docker exec withvolume cat /root/hello`{{execute}}
5. Remove the container: `docker stop withvolume && docker rm withvolume`{{execute}}
6. Create a new container: `docker run -d --name withvolume -v myvolume:/root alpine:latest sleep 1d`{{execute}}
7. Try to print the file: `docker exec withvolume cat /root/hello`{{execute}}

Great, the file is still there!

In fact, a volume can even be mounted to more than one container:

1. Make sure the `withvolume` container is still running
2. Create a second container, and mount the volume: `docker run -d --name withvolume2 -v myvolume:/root debian:stretch-slim sleep 1d`{{execute}}
3. Try to print the file: `docker exec withvolume2 cat /root/hello`{{execute}}

If you have extra time, try creating a new file with both containers running. Notice that it will be available to both containers.

> It is also possible to mount folders from your host into a container. On the left side of the `:`, put the full path to the local folder
> For example: `docker run -d -v /data/db:/var/lib/db` will mount `/data/db` on the host to `/var/lib/db` in the container.
