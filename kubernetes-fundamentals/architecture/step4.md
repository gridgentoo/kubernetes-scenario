At its core, Kubernetes operates via an API. The `kubectl` binary wraps the REST API in a command line tool, however, you can directly access the REST API if you want.

First, you need to open a new shell, and run kube-proxy:

`kubectl proxy --port=8080 &`{{execute}}

Now, we can go back to our first shell and execute requests directly against the API:

`curl http://localhost:8080/`{{execute}}

This will give us a listing of all API endpoints that we can access

Let's get the version:

`curl http://localhost:8080/version`{{execute}}

We can also check the health of the API Server:

`curl http://localhost:8080/healthz`{{execute}}

The same goes for etcd:

`curl http://localhost:8080/healthz/etcd`{{execute}}

Let's next see the different application APIs that are supported:

`curl http://localhost:8080/apis/apps`{{execute}}

These are the different API versions that are supported on this Kubernetes cluster. Kubernetes typically supports `alpha` and `beta`, in addition to their production ready components. We can see that here.

Let's look at all `v1` (production-ready) app objects in our cluster:

`curl http://localhost:8080/apis/apps/v1`{{execute}}

This shows us every `apps/v1` object, and their configuration. Let's pick a specific type:

`curl http://localhost:8080/apis/apps/v1/deployments`{{execute}}

A Deployment is a high-level abstraction that manages a containerized application. Now we have the listing of all `v1` Deployments. Let's inspect the `coredns` one:

`curl http://localhost:8080/apis/apps/v1/namespaces/kube-system/deployments/coredns`{{execute}}

The Kubernetes API is extremely powerful and flexible.

However, you'll save the "fun" of manually generating HTTP requests, and we'll use the `kubectl` tool from now on.
