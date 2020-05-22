To demonstrate Horizontal Pod Autoscaler (HPA) we will use a custom container image based on the php-apache image. This image is part of the Kubernetes project to demonstrate CPU load. The Dockerfile has the following content:

```
FROM php:5-apache
ADD index.php /var/www/html/index.php
RUN chmod a+rx index.php
```

The app defines an index.php page which performs some CPU intensive computations:

```
<?php
  $x = 0.0001;
  for ($i = 0; $i <= 1000000; $i++) {
    $x += sqrt($x);
  }
  echo "OK!";
?>
```

Pods defined inside DaemonSets, StatefulSet, Jobs and CronJobs are not scaled with replication so HPA only scale Pods defined inside Deployment of ReplicaSet objects.

Deploy the app to your Kubernetes cluster.

`kubectl create -f php-apache.yaml`{{execute}}

If you inspect the YAML file (`cat php-apache.yaml`{{execute}}) you will see a `resource.requests.cpu` setting. When a Pod is deployed these quotas must be specified for the metrics to expect the scaler to make observations and decisions upon. For instance, if you omit the cpu quota for the Pod the HPA will log `missing request for cpu`. It's also a best practice to provide the [resource quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/) of CPU and memory for each container as it helps the Kubernetes Scheduler to efficiently find the best locations ([bin packing](https://en.wikipedia.org/wiki/Bin_packing_problem)) where to run your containers.

The Pod with its Service will be available in a moment.

`kubectl get deployments,pods,services`{{execute}}
