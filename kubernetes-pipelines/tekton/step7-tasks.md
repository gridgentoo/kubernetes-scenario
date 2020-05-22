
Pipeline Tasks (and ClusterTasks) are entities that define a collection of sequential steps you would want to run as part of your continuous integration flow. A Task will run inside a Pod on your cluster.

For our pipeline, we have defined two tasks.

1. **task-build-src** clones the source, builds the Node.js based container, and pushed the image to a registry.
2. **task-deploy** pulls the container image from the private registry and runs it on this Kubernetes cluster.

Inspect each Task and see how they is comprised of distinct, modular, and sequential steps.

`cat pipeline/task-build-src.yaml`{{execute}}

`cat pipeline/task-deploy.yaml`{{execute}}

Pods in Kubernetes are comprised of one or more containers. Each Tekton Task runs as a Kubernetes Pod. Each Step in the Task runs as a separate container in the Task's Pod.

<img align="right" src="./assets/mess.jpg" width="150">

Everything the steps need is either in the containers or are referenced as Tekton resources. Older CI/CD engines would rely on enormous plugins that were jammed into a global space on the engine. This let to many [anti-patterns](https://en.wikipedia.org/wiki/Anti-pattern) like `shoot the messenger` and `dependency hell`. This monolithic plugin ball of mud is avoided with Tekton by having each step as modular and atomic steps that contain all the details and dependencies to complete their sole responsibilities. Since a Task is a Pod you also are leveraging the distributed computing nature of Kubernetes and all the CPUs, memory, and I/O across your clustered machines.

Apply these Tasks declarations.

`kubectl apply -f pipeline/task-build-src.yaml`{{execute}}

`kubectl apply -f pipeline/task-deploy.yaml`{{execute}}

Verify the Tasks have been declared.

`tkn tasks list`{{execute}}