The _Kubeless_ secret sauce is your function's source code is deployed into a Kubernetes ConfigMap. The ConfigMap contents is listed with this:

`kubectl get configmaps`{{execute}}

You can view ConfigMap and see the deployed code here:

`kubectl describe configmap fibonacci`{{execute}}

When the Kubeless CLI tool registers your function it sends a custom and declarative Kubernetes manifest file. The file itself has a custom Kubernetes _kind_. These kinds are registered as CRDs. The list of CRDs for Kubeless can be found with this

`kubectl get crds --namespace kubeless`{{execute}}

On deployment _Kubeless_ starts a pre-baked container containing the Python executable, then your function's source code is referenced from the ConfigMap and injected into the Python container. In turn, the container is fronted by a Kubernetes Service where you can invoke the function from a Service call. Inspect the Deployment and Service with this command:

`kubectl get deployments,pods,services`{{execute}}

You can also explore the Kubeless functions in the Kubernetes dashboard.
