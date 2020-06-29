The `Explain` command is a great way to understand the defined structure of a resource or kind. This is accomplish through `kubectl explain <kind>`.

`kubectl explain ns`{{execute}}

Almost all resources at this high-level report roughly the same apiVersion, kind, metadata, spec, status information. To get the full structure of this kind then use the `--recursive` flag.

`kubectl explain ns --recursive`{{execute}}

Notice the status field `phase`. Let's display that as an output.

`kubectl get ns -o custom-columns=NAME:.metadata.name,PHASE:.status.phase`{{execute}}

`Explain` is useful to help understand the structure of types deployed in Kubernetes. It comes into even more use when the resource are custom and provided by other Operators outside the Kubernetes documentation.

## Describe

Don't confuse the `Explain` command with the `Describe` command. While `Explain` reports on the type of the resource, the `Describe` reports the details of the instance of a resource. It's easy to confuse the two, so try the `Describe` command on the `kube-system` namespace to see the difference.

`kubectl describe namespace kube-system`{{execute}}

Notice this is requesting the details of the specific instance of a namespace called kube-system. This is different than the `Explain` command that is reporting the aspects of the resource type.
