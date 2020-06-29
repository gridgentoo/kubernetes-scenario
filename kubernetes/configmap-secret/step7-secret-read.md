Just as there are three ways to get ConfigMap data into a container, the same three techniques are available for Secrets. This step covers secrets supplied to containers as environment properties.

From the previous steps, there is a secret in the cluster called _db-creds_.

`kubectl get secrets`{{execute}}

The secret has two values _username_ and _password_.

`kubectl get secret db-creds -o yaml`{{execute}}

View the definition of the Pod that will access this secret.

`cat kuard.yaml`{{execute}}

Launch the Kuard application and associate a service with its Pod.

`kubectl create -f kuard.yaml`{{execute}}

`kubectl create -f kuard-service.yaml`{{execute}}

The kuard application portal can be seen at this link

https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/-/env

Notice at the bottom of the Server Env page the two secrets are present.

This exposes the basics of secrets. There is a bit more to secrets than just this example which is [documented here](https://kubernetes.io/docs/concepts/configuration/secret/).
