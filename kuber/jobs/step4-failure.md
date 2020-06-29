Failure is embraced as a first class visitor in Kubernetes. All things are expected to fail at some point. Let's see the behavior when a job fails.

By default, the _kaurd_ container completes with an success exit code of 0. A command can be passed to force a different exit code. Inspect this job definition that forces the container to end with an exit code of 1 after generating 3 keys.

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-2-job-oneshot-failure1.yaml`{{execute}}

Run the job and see it fail.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-2-job-oneshot-failure1.yaml`{{execute}}

After it runs for a moment, inspect the Pod status.

`kubectl get pod --selector job-name=oneshot`{{execute}}

In a moment, notice the column _RESTARTS_ reports Kubernetes is attempting to re-run the job in hopes the subsequent executions will pass. This is because the job was submitted with the `restartPolicy: OnFailure` setting. Alternatively, the policy could have been set to `Never` to prevent the restarts.

Cleanup this job with the _delete_ command.

`kubectl delete jobs oneshot`{{execute}}
