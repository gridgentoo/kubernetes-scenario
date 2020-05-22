Instead of using the Kubeless CLI, it is possible to deploy Kubeless Functions directly using the Kubernetes API and creating Function objects. A manifest can be defined and submitted to Kubernetes with the `kubectl create` command. Take a look at this example manifest

`cat ruby-example.yaml`{{execute}}

Notice at the top the manifest Kind is _Function_. The Kind Function is not part of the core set of Kubernetes Kinds. Instead, this Kind is an extension added by the Kubeless framework. This illustrates the extensibility of Kubernetes to allow custom extensions to the Kubernetes API. The Kubernetes feature of custom resource definitions (CRDs) permits this solution. To see the CRDs that Kubeless has added run this

`kubectl get crds --namespace kubeless`{{execute}}

Now, let's try running a function submitted by definition through a Kubernetes manifest file

`kubectl create -f ruby-example.yaml`{{execute}}

Wait until the deployment is _Available_.

`kubectl get deployments`{{execute}}

If it's needed, add a proxy. It may benignly show error as a previous step already asked you to start a proxy as it may have been added in one of the previous lessons.

`kubectl proxy --port 8080`{{execute T2}}

Exercise the function.

`echo "The latest version of Kubeless CLI is $(curl -s localhost:8080/api/v1/namespaces/default/services/ruby-example:8080/proxy/)"`{{execute T1}}

This function outputs the latest release version found online for Kubeless.

Notice all these steps were accomplished without Kubeless commands, just Kubernetes commands.
