It's generally preferable to define resources such as Jobs in resource manifests such as this YAML file.

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-1-job-oneshot.yaml`{{execute}}

To invoke this Job declaration use the _apply_ command.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-1-job-oneshot.yaml`{{execute}}

The job can be inspected with the _describe_ command.

`kubectl describe jobs oneshot`{{execute}}

When Pods run the output from the containers are captured in the Pod's /var/log directory. If you know the name of the specific job instance, the _logs_ command can extract that log. With a little help from _grep and cut_ the name of the job is extracted and passed to the _logs_ command.

`export JOB_ID=$(kubectl describe jobs oneshot | grep -o 'Created pod: .*' | cut -f3- -d' ')`{{execute}}

`echo $JOB_ID`{{execute}}

`kubectl logs $JOB_ID`{{execute}}

Once you are done inspecting the job, use the _delete_ command to remove it.

`kubectl delete jobs oneshot`{{execute}}

Next, explore what happens when a Job fails.
