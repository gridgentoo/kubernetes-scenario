OpenShift ships with a feature rich web console as well as command line tools
to provide users with a nice interface to work with applications deployed to the
platform. The OpenShift tools are a single executable written in the Go
programming language and is available for Microsoft Windows, Apple OS X and Linux.

In order to login, we will use the **oc** command and then specify the server that we
want to authenticate to:

```
oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com
```{{execute}}

You might get a question wether to use an insecure connection. Enter `y` and then enter 
your username and password:
* Username: **developer**
* Password: **developer**

Congratulations, you are now authenticated to the OpenShift server.

> You can verify that you are logged in as **developer** using `oc whoami`