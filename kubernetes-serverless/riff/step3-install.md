For this scenario, Katacoda has just started a fresh Kubernetes cluster for you. Verify it's ready for your use.

`kubectl cluster-info`{{execute}}

Riff is a command-line interface for running functions on Knative on Kubernetes. Install the command-line binary.

`curl -Lo riff-linux-amd64.tgz https://github.com/projectriff/riff/releases/download/v0.2.0/riff-linux-amd64.tgz && tar xvzf riff-linux-amd64.tgz && sudo mv riff /usr/local/bin/`{{execute}}

Verify Riff is available by checking the version.

`riff version`{{execute}}

Using the Riff CLI tool too initialize Knative. This will include initialization of the Istio service mesh and telemetry services.

`riff system install --node-port`{{execute}}

Watch the Pods start.

`watch kubectl get pod --all-namespaces`{{execute T2}}

Once started check one more time.

`kubectl get pod --all-namespaces`{{execute T2 interrupt}}
