Kubernetes is not very helpful if you cannot make changes to it and start adding applications. To start editing Kubernetes, explore the command-line tool and the dashboard to see how changes can be applied and verified.

As a simple exercise create two namespaces.

`
kubectl create namespace sandbox-a
kubectl create namespace sandbox-b
`{{execute}}

Verify the namespaces has been created.

`kubectl get namespaces`{{execute}}

Labels can be attached to objects in Kubernetes. Attach a descriptive label to these two namespaces.

`
kubectl label namespace sandbox-a group=development
kubectl label namespace sandbox-b customer=alpha
`{{execute}}

Verify the associated labels have been applied.

`kubectl describe namespace sandbox-a`{{execute}}

Using the label, view only the namespaces with the label you filter for.

`kubectl get namespaces -l group=development`{{execute}}

Verify these names spaces and labels in the [Kubernetes Dashboard.](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/)

Kubernetes relies on the simplicity of labeling and grouping with namespaces as tool to help your organize your applications and hook them together.
