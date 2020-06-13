You can now start deploying applications to Kubernetes based on public charts. To find available charts use the search command. 

For example, to deploy Redis search the [Helm Hub](https://hub.helm.sh/) for that chart by name.

`helm search hub redis`{{execute}}

Previously you added the Google repository.

`helm repo list`{{execute}}

Search that repo for Redis.

`helm search repo redis`{{execute}}

For many applications, sometimes there is more than one chart provider or project. Once found, more information may be revealed with the _inspect_ command.

`helm show chart stable/redis`{{execute}}

or

`helm show readme stable/redis`{{execute}}
