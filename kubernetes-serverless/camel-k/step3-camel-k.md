Camel K has a command-line interface for installing, inspecting, running functions on Kubernetes. Camel K also leverages the advantages of Knative and Istio.

Apply this command to install the executable Linux binary for the command-line Interface (CLI) called _kamel_.

`curl -Lo kamel.gz https://github.com/apache/camel-k/releases/download/0.0.4/camel-k-client-0.0.4-linux-64bit.tar.gz && tar xvzf kamel.gz && sudo mv kamel /usr/local/bin/`{{execute}}

Verify the CLI is available by checking the version:

`kamel version`{{execute}}

Using CLI tool initialize Camel K. This will include initialization of the Istio service mesh and telemetry services.

`kamel install --registry="http://$NODE_IP:$NODE_PORT"`{{execute}}

Watch the services start

`kubectl get deployments -w --all-namespaces`{{execute}}

Once started run submit this raw code.

`kamel run sample.java`{{execute interrupt}}
