Create a namespace for the installation target.

`kubectl create namespace redis`{{execute}}

With a known chart name, use the _install_ command to deploy the chart to your cluster.

`helm install my-redis stable/redis --namespace redis`{{execute}}

With the install command Helm will launch the required deployments, ReplicaSets, Pods, Services, ConfigMaps, or any other Kubernetes resource the chart defines. View all the installed charts.

`helm list`{{execute}}

or

`helm ls`{{execute}}

The installed `my_redis` chart should be listed.

The next step will verify the deployment status.
