The following command will run a Vue.js web app on port 8080:

`docker run -d --name vuejs -p 8080:8080 sylus/vue-hello-world`{{execute}}

Visit the Ghost web page here: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Run Portainer. Portainer is a simple management solution for Docker. Easily manage your Docker hosts and Docker Swarm clusters via Portainer web user interface. https://portainer.io/

The following command will run Portainer on port 9000:

`docker volume create portainer_data`{{execute}}

`docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer`{{execute}}

Visit the Portainer admin page here and add a password: https://[[HOST_SUBDOMAIN]]-9000-[[KATACODA_HOST]].environments.katacoda.com/

Containers and Docker are a powerful tools and you should gain a solid foundation in containers and Docker before moving on to running Kubernetes in production.
