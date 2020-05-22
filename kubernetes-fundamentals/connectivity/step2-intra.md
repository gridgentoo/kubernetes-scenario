An immediate benefit Kubernetes provides developers of containers is a level playing field for communicating between containers. Each container runs in a Pod, each Pod is fronted by a Service that routes traffic to its associated Pods, round-robin style. While each Pod in Kubernetes' network plane is assigned a virtual IP, you should not to connect to containers with these IPs. In fact, within your container code there should typically be no coupling to the Kubernetes ecosystem.

To start communicating to a Service and its associated Pod, install a small, typical NGINX application. Add a [Nginx](https://hub.docker.com/_/nginx/) deployment with an associated service named "nginx" to the _default_ namespace:

`kubectl create -f https://raw.githubusercontent.com/javajon/kubernetes-fundamentals/master/nginx/nginx.yaml`{{execute}}

Verify the Nginx deployment is _available_ (1) with two runnings pods and a service.

`kubectl get services,pods,deployments`{{execute}}

Now, let's communicate with the service. Communication is easy with the assistance of an internal DNS service. This is where Kubernetes' resource object names and labels are helpful. Services all have declared names and the service names become the key names the DNS uses to find the services.

Start and enter a [Busybox container](https://docs.docker.com/samples/library/busybox/) in a separate Pod in the same Namespace.

`kubectl run curl-test --image=radial/busyboxplus:curl --generator=run-pod/v1 -i --tty --rm`{{execute}}

Shortly the terminal will assume the prompt _inside_ the Busybox container. Try these examples.

Because the busyboxplus container is running in the same namespace (_default_) as the Nginx service, the URL is small and simple.

`curl http://nginx`{{execute}}

`curl -s http://nginx:80 | grep "Thank you"`{{execute}}

The namespace can optionally be added to the URL.

`curl http://nginx.default`{{execute}}

Here is the full URL to the service.

`curl --silent http://nginx.default.svc.cluster.local:80 | grep "Thank you"`{{execute}}

As a developer your code would simply reach out to these URLs created from the assigned service names.

The name of the service could be passed in as an environment variable to the container. Since the Busybox container was installed after NGINX, the Busybox environment already has information about the various URLS to access the other services. See them listed.

`env | grep NGINX`{{execute}}

If the Busybox service was created before the Nginx service the urls would still work, but the environment settings would not be present. It's not the best idea to rely on these environment setting since the order of creation of services is not guaranteed.

Exit the shell in the BusyBox container.

`exit`

You must type this, but don't do it twice as it will exit this scenario.

Tip: Try to leave most communication on port 80 or a common port the service expects to be on. Later add a meshing network like Istio. Without further code modifications Istio can step in to ensure all intra-communication is secured with mutual TLS and monitored for tracing and metrics.
