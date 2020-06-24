To create your own Docker image you will need to create a Dockerfile.

A Dockerfile defines the layers that will be assembled to create the final image.

Let's take a look at a simple Dockerfile.

`cat resources/simple/Dockerfile`{{execute}}

Our Dockerfile consists of two instructions:

1. `FROM nginx:1.15`

   This instructions tells Docker that we want to extend the official Nginx image.
2. `COPY index.html /usr/share/nginx/html/index.html`

    This instructions tells Docker to copy a file into the image.

Now let's build the image and call it `simple`:

`docker build -t simple resources/simple`{{execute}}

And let's now run a container based on our image:

`docker run --name simple -d -p 80:80 simple`{{execute}}

Visit https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/ to see the website. You should see "Hello, World!".

You can now cleanup with `docker stop simple && docker rm simple`{{execute}}.

> **Want to try something?** Change the contents of `resources/simple/index.html` and rebuild the image. Run a container based on the new image and see that the contents have now changed.
