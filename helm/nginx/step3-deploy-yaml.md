Kubernetes relies on manifests as declarations for the desired state of the cluster. When you submit a manifest, the Kubernetes components such as the controller, scheduler, and Kubelets will busily help you by accepting this new state and ensure the cluster matches the declaration you specified. Nothing you do with Kubernetes is scripted with long and imperative scripts. Instead, a series of declarative manifests simply state the truth and the Kubernetes reconciliation engine (controller) will ensure your statements of truth matches the reality of the cluster. If it does not, notifications can be queried or published.

Inspect the declaration for Nginx.

`cat nginx.yaml`{{execute}}

Typically manifests are sources stored in version control in YAML file format. Kubernetes also accepts manifests in JSON form but since we often edit these files, the YAML format tends to be easier to read and edit than JSON. These source files are examples of [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code).

Let's send this manifest declaration to our Kubernetes cluster.

`kubectl create -f nginx.yaml`{{execute}}

Notice the manifest defines both a `Kind: Deployment` and a `Kind: Service`. The Deployment defines the Nginx in a container and a Pod. The Service provides an access point and load balancer in front of the Pod. This specific deployment has three Pods specified.

As we did in the previous step, inspect the starting resources. This time they are named `nginx-two`.

`kubectl get deployments,replicasets,pods,services`{{execute}}.

Notice in this deployment there are three Pods declared. The Service will load balance between the Pods, round-robin style.

Once available, you can exercise the new Service in two ways. First, simply from the command line.

`curl https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

The same web interface for "nginx-one" can also be seen in your browser from the "nginx-two" tab above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com

As an alternative to the kubectl CLI, you can also observe the Pod logs in the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/). Use this script to access the protected Dashboard.

`token.sh`{{execute}}
