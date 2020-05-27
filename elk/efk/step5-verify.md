All three installations of ElasticSearch, Fluent Bit, and Kibana are either still initializing or fully available.

To inspect the status of these deployments run this watch.

`watch kubectl get deployments,pods,services --namespace=logs`{{execute}}

Once complete, the Pods will move to the _Running_ state. The full stack is not ready until all the Deployment statuses move to the _Available (1)_ state.

While observing the progress, **be patient, as it takes time for the stack to initialize, even with this small configuration.**

When all Deployments report _Available_ and the Pods report _Running_ use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

You know have a full EFK stack running. Granted this stack smaller and not configure to he highly available or with access protection, but it comprises a functional solution to get started.
