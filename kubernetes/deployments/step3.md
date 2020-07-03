The most effective and repeatable way to manage our Deployments is with Manifest files. Here is one that defines our simple vue application (`./resources/vue-simple.yaml`):

`cat resources/vue-simple.yaml`{{execute}}

If we look at this Deployment, it looks very similar to our PodSpec and ReplicaSet Manifests. We can add any configuration that we've already covered in the Pod section to this manifest. We should also configure the ReplicaSet to match our replication requirements.

Let's create our Deployment: `kubectl create -f ./resources/vue-simple.yaml`{{execute}}

All Kubernetes deployment YAML files must contain the following specifications:

#### **apiVersion** - `apps/v1`

The `apiVersion` specifies the version of the API to use. The API objects are defined in *groups*. The `deployment` object belongs to the `apps` API group. Group objects can be declared `alpha`, `beta`, or `stable`:
  * `alpha` - may contain bugs and no guarantee that it will work in the future. Example: `(object)/v1alpha1`
  * `beta` - still somewhat unstable, but will most likely go into the Kubernetes main APIs. Example: `(object)/v1beta1`
  * `stable` - Only stable versions are recommended to be used in production systems. Example: `apps/v1`

NOTE: You can check the latest Kubernetes API version here: https://kubernetes.io/docs/reference/

#### **kind** - `Deployment`

A **`kind`** value declares the type of Kubernetes object to be described in the Yaml file. Kubernetes supports the followng 'kind' objects:

  1. `componentstatuses`
  1. `configmaps`
  1. `daemonsets`
  1. `Deployment`
  1. `events`
  1. `endpoints`
  1. `horizontalpodautoscalers`
  1. `ingress`
  1. `jobs`
  1. `limitranges`
  1. `Namespace`
  1. `nodes`
  1. `pods`
  1. `persistentvolumes`
  1. `persistentvolumeclaims`
  1. `resourcequotas`
  1. `replicasets`
  1. `replicationcontrollers`
  1. `serviceaccounts`
  1. `services`

#### **`metadata`**

The **`metadata`** declares additional data to uniquely identify a Kubernetes object. The key metadata that can be added to an object:

  * `labels` - size [constrained](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#syntax-and-character-set) key-value pairs used internally by k8s for selecting objects based on *identifying information*
  * `name` - the name of the object (in this case the name of the deployment)
  * `namespace` - the name of the namespace to create the object (deployment)
  * `annotations` - large unstructured key-value pairs used to provide *non-identifying* information for objects. k8s cannot query on annotations.
  * **`spec`** - the desired state and characteristics of the object. `spec` has three important subfields:
    - `replicas`: the numbers of pods to run in the deployment
    - `selector`: the pod labels that must match to manage the deployment
    - `template`: defines each pod (containers, ports, etc. )
