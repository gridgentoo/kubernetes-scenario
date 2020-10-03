To upload an image to Docker Hub, we need to do a few tricks and follow these steps:

Log in to Docker Hub: `docker login`{{execute}}

```
Username: #Enter your username here
Password: #Enter your password here
Login Succeeded
```

Copy the Docker image you want to push to a different path in the Docker repository on your server:
`docker tag httpd:latest <username>/httpd:latest`{{copy}} 


You can push image to docker hub by running following command:
`docker push <username>/httpd:latest`{{execute}} 

Now the image is pushed to your Docker Hub and available for anyone to download. 
`docker search <username>/*`{{copy}}

You can check the same result using a web browser. If you go to https://hub.docker.com/ you should be able to see this httpd image available under your account.