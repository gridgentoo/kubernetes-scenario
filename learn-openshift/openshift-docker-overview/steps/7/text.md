In order to delete a container, you can use the docker rm command. If the container you want to delete is running, you can stop and delete it or use the -f option and it will do the job:

`docker run -d --name=httpd httpd`{{execute}}

`docker rm httpd`{{execute}}

```
Error response from daemon: You cannot remove a running container 3b1150b5034329cd9e70f90ee21531b8b1ab1d4a85141fd3a362cd40db80e193. 
```

Stop the container before attempting removal or force remove. Let's try using -f option.
`docker rm -f httpd`{{execute}}


Another trick you can use to delete all containers, both stopped and running, is the following command:
`docker rm -f $(docker ps -qa)`{{execute}}


```
830a42f2e727
backgroundcontainer
mycontainer
419e7ce2567e
```

Verify that all the containers are deleted:
`docker ps  -a`{{execute}}