A huge advantage of running applications on Kubernetes is there are typically large amounts of resources to utilize. So far these jobs have been working serially and underutilizing the resources. Often real jobs may be long-running and incur notable CPU and memory consumption. A technique to solve performance problems is to run the jobs in parallel. Instead of each job creating a series of keys serially,3 have multiple jobs work on smaller units of work.

## A Race ##

Let's have a race to validate this claim, even on this limited Katacoda Kubernetes instance.

### Serially ###

First, run the job we ran in the previous step 2 and have it generate 10 keys.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-1-job-oneshot.yaml`{{execute}}

This time we will watch for is the duration result. By inspecting the status times in the job's YAML the duration time can be extracted. It will be about 30 seconds before the end time is recorded. If a message `invalid date /syntax error` appears, it just means the `completionTime` has not been recorded yet.

`echo "Duration: $(expr $(date +%s -d $(kubectl get job oneshot -o json | jq -r .status.completionTime)) - $(date +%s -d $(kubectl get job oneshot -o json | jq -r .status.startTime))) seconds"`{{execute}}

Once the `seconds` duration value appears, take note of it.

`export SERIAL_DURATION=$(expr $(date +%s -d $(kubectl get job oneshot -o json | jq -r .status.completionTime)) - $(date +%s -d $(kubectl get job oneshot -o json | jq -r .status.startTime)))`{{execute}}

`echo $SERIAL_DURATION`{{execute}}

### Parallel ###

Here is a descriptor that will run the job in parallel. Inspect the definition

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-3-job-parallel.yaml`{{execute}}

Notice now in the `spec:` the two settings have been applied to ensure the parallelism features is enabled `parallelism: 5` and `completions: 10`.

The template runs 10 jobs where each job generates 10 keys. For a better race comparison we want 10 jobs that each generate a single key, so the template will be slightly modified using _sed_ to change the `keygen-num-to-gen` value from 10 to 1.

`curl -s https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-3-job-parallel.yaml | sed '/num-to-gen=/s/=.*/=1"/' > job-parallel.yaml`{{execute}}

Notice now the `keygen-num-to-gen` setting is set to `=1`.

`cat job-parallel.yaml`{{execute}}

Run the jobs in parallel.

`kubectl apply -f job-parallel.yaml`{{execute}}

Again, by inspecting the status times in the job's YAML the duration time can be extracted. It will be less than 30 seconds before the end time is recorded. If a message `invalid date / syntax error` appears, it just means the `completionTime` has not been recorded yet.

`echo "Duration: $(expr $(date +%s -d $(kubectl get job parallel -o json | jq -r .status.completionTime)) - $(date +%s -d $(kubectl get job parallel -o json | jq -r .status.startTime))) seconds"`{{execute}}

Once the seconds number appears, take note of it.

`export PARALLEL_DURATION=$(expr $(date +%s -d $(kubectl get job parallel -o json | jq -r .status.completionTime)) - $(date +%s -d $(kubectl get job parallel -o json | jq -r .status.startTime)))`{{execute}}

`echo $PARALLEL_DURATION`{{execute}}

## Race Results ##

Let's take a look at the race results between the serial and parallel execution of the key generation job.

`clear && echo -e "For over a decade prophets have voiced the contention that the organization of a single computer has reached its limits and that truly significant advances can be made only by interconnection of a multiplicity of computers. - Gene Amdahl in 1967.\n\nThe results are in:\nSerial: $SERIAL_DURATION\nParallel: $PARALLEL_DURATION"`{{execute}}

The higher the number of keys to generate will correlate to a larger gap in time between these two techniques.

Finally, delete the 2 jobs by filtering on a label.

`kubectl delete jobs --selector chapter=jobs`{{execute}}

However, to fully take advantage of parallelism some asynchronous message queuing should also be woven into the mix. In the next step you will leverage a queue.
