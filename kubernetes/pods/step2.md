Issuing commands directly from the command line is great for quick inspection, but for production systems, repeatability is very important. To ensure repeatability, Kubernetes object specification files are used. We generally call these PodSpec or Manifest files.

Like all Kubernetes objects, Pods can be described with either YAML or JSON syntax. Kubernetes provides easier to use YAML to describe objects, but uses the JSON format internally for all objects.

> **Remember, YAML is extremely sensitive to spacing**

Here is an example of a simple NGINX pod in both formats:

#### JSON

```json
{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata":{
        "name": "nginx",
        "labels": {
            "name": "nginx"
        }
    },
    "spec": {
        "containers": [{
            "name": "nginx",
            "image": "nginx",
            "ports": [{"containerPort": 80}]
        }]
    }
}
```

#### YAML

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```

Viewing the PodSpec as YAML is generally easier to read/understand. In this case, we can see a few things that our PodSpec is configuring:

- *apiVersion*: the API version of the object, `v1` means production ready. There is also `alpha` and `beta`.
- *kind*: defines the type of object
- *metadata*: provides metadata to the object
- *spec*: the specification defining the containers in the Pod

## See a Pod specification

To see the file specification for a running pod, use the following command(s):

**NOTE**: If there are no running pods, start one from the command line:

`kubectl run nginx --image=nginx --port=80 --restart=Never`{{execute}}

To see YAML output:

`kubectl get pod nginx --output=yaml`{{execute}} or `kubectl get pods/nginx -o yaml`{{execute}}

To see JSON output:

`kubectl get pod nginx --output=json`{{execute}} or `kubectl get pods/nginx -o json`{{execute}}

The output reflects the exact arguments that were used to launch the Pod as well as some additional information. This output can be used to create a specification file.

If you started a new Pod, delete the pod with `kubectl delete pod nginx`{{execute}}.

## Create a Pod specification file

Open `resources/vue-complete.yaml` in the editor. It defines a pod called `vue`, with one container.

Now that we've got our PodSpec, let's create a Pod from it:

`kubectl apply -f ./resources/vue-complete.yaml`{{execute}}

Verify that the new Vue.js pod is running:

`kubectl get pods`{{execute}}

We can also inspect the Pod:

`kubectl describe pod vue`{{execute}}

## Configure Pods

Of course, this isn't all we can do with a PodSpec file, there is a lot that we can configure.

With `resources/vue-complete.yaml` open in your editor, let's add a default command. Add the `command` entry under `image`:

`command: ['sh', '-c', 'echo $(env) && sleep 3600']`

What we'll do is add this to our PodSpec file. Now it should look like this:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    ports:
    - containerPort: 80
```

We can run `kubectl apply -f resources/vue-complete.yaml`{{execute}} to update this pod. Because certain fields can't be changed after the pod is created, you'll have to remove the pod first (`kubectl delete -f resources/vue-complete.yaml`). This won't be a problem after we learn about deployments.

Next, we'll configure environment variables. In Kubernetes, you do this with `env`, specifically:

```yaml
env:
  name: username
  value: admin
```

Let's set two environment variables in our PodSpec:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    ports:
    - containerPort: 80
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    env:
    - name: username
      value: admin
    - name: password
      value: password
```

Now if we were to update the Pod, it would output the environment variables, including our two new ones.

Next, we'll configure a local volume mount. In Kubernetes, you define a volume in the Pod specification, but outside of the `containers` list. Inside the containers list, you define a `volumeMount` which requests storage from a volume.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    ports:
    - containerPort: 80
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    env:
    - name: username
      value: admin
    - name: password
      value: password
    volumeMounts:
      - name: my-volume
        mountPath: /data

  volumes:
  - name: my-volume
    emptyDir: {}
```

Now when we run this Pod, we will have a volume inside the Pod mounted to /data inside the vue container.

Pods can also have a defined resource limit. We do this with `resources`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    ports:
    - containerPort: 80
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    env:
    - name: username
      value: admin
    - name: password
      value: password
    volumeMounts:
      - name: my-volume
        mountPath: /data
    resources:
      limits:
        memory: "128Mi"
        cpu: "0.5"

  volumes:
  - name: my-volume
    emptyDir: {}
```

This will limit our pod to using only 50% of a single CPU core, and no more than 128 Megabytes of RAM. If it tries to use more, Kubernetes will terminate the pod.
