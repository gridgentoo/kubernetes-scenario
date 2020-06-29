Use the Kubectl _run_ command as a simple way to create a Job. This command runs the Job in the form of a Pod that contains a single container. The app in the container simply generates security keys.

`kubectl run -i oneshot \
--image=gcr.io/kuar-demo/kuard-amd64:1 \
--restart=OnFailure \
-- --keygen-enable --keygen-exit-on-complete --keygen-num-to-gen 10`{{execute}}

Once the job is complete the Pod and container are no longer running, but are still present and its state and logs can be inspected.

Use the _get_ command to list the current jobs.

`kubectl get jobs`{{execute}}

Take a peek at the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) (tab above the command line) and see how the Job is created as a resource. In the dashboard, explore the details and logs of the Job and Pod that just ran.

Once you are done inspecting the job, use the _delete_ command to remove it.

`kubectl delete jobs oneshot`{{execute}}

This steps explored starting a job with just a command. The next step will run the same job, but from a resource defined in a YAML.
