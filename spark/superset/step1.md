# Setup requirements

#### update docker and docker-compose

Lets's first do some updating:

`apt upgrade docker.io`{{execute}}

`pip install --upgrade pip`{{execute}}

Docker-compose is not upto date in apt, so remove and manually install the latest version

`apt-get remove docker-compose`{{execute}}

`sudo rm /usr/local/bin/docker-compose`{{execute}}

`pip uninstall docker-compose`{{execute}}

Install instructions can be found at https://docs.docker.com/compose/install/

`sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}

`sudo chmod +x /usr/local/bin/docker-compose`{{execute}}

#### Clone seuperset

`git clone https://github.com/apache/incubator-superset/`{{execute}}   

`cd incubator-superset`{{execute}}


and lets start docker-compose - it'll take about 5 minutes

** WIP needs 3GB? **

`docker-compose up`{{execute}}   

lets check the containers are up and running:   

`docker-compose ps`{{execute}}

https://[[HOST_SUBDOMAIN]]-8088-[[KATACODA_HOST]].environments.katacoda.com   

now jump over to port 8088  
username: admin  
password: admin  
