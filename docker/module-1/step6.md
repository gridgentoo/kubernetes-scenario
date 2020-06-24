Now let's take a look at some containers logs. This is another good way to troubleshoot container issues.

Let's run NGINX container again and look at the logs:

`docker container run -p 80:80 -d --rm --name nginx nginx`{{execute}}

`docker container ps`{{execute}}

`docker container logs nginx`{{execute}}

`docker container logs -f nginx`{{execute}}

By using the -f switch, we are now live tailing the logs. Visit the NGINX page here and you will see the logs update. https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/
