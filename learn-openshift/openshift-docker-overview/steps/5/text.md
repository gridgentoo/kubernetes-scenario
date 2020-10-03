
From the output, we can see that the container status is UP. Now we can execute some commands inside the container using the docker exec command with different options:
`docker exec -i backgroundcontainer ls -l /`{{execute}}

```
total 12
drwxr-xr-x. 2 root root 4096 Feb 15 04:18 bin
drwxr-xr-x. 2 root root 6 Nov 19 15:32 boot
drwxr-xr-x. 5 root root 360 Mar 6 21:17 dev
drwxr-xr-x. 42 root root 4096 Mar 6 21:17 etc
drwxr-xr-x. 2 root root 6 Nov 19 15:32 home
...
Output truncated for brevity
...
```

Option -i (--interactive) allows you to run a Docker without dropping inside the container. But we can easily override this behavior and enter this container by using -i and -t (--tty) options (or just -it):
`docker exec -it backgroundcontainer /bin/bash`{{execute}}


To exit the container console, just type `exit`{{execute}} or press `Ctrl` + `D`.

#### Starting and stopping containers
We can also stop and start running containers by running docker stop and docker start commands:


Enter the following command to stop the container:
`docker stop backgroundcontainer`{{execute}}

Enter the following command to start the container:
`docker start backgroundcontainer`{{execute}}