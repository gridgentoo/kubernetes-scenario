Let's get a list of api-resources.

`kubectl api-resources`{{execute}}

Resources can be either scoped to the cluster or associated with a Namespace. Most resources are associated with Namespaces, however, there are some cluster scope resources that do not make sense to be associated with a Namespace. List the cluster scoped resources.

`kubectl api-resources --namespaced=false`{{execute}}

As you can see resources like `PersistentVolumes` are scoped at the cluster level and not associated with namespaces.

In the list above, see if you can find the abbreviated name (`SHORTNAME`) for `PodSecurityPolicy`. You can use these short names when using the `kubectl` tool.

`kubectl get ns`{{execute}}

Most of the api-resources are grouped. For instance, the two job types are grouped in the batch group

`kubectl api-resources --api-group=batch`{{execute}}
