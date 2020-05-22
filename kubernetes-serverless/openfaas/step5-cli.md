A common way to interact with OpenFaaS is from the command line. Install the OpenFaaS command-line interface (CLI) tool.

`curl -SLs cli.openfaas.com | sudo sh`{{execute}}

When you see the ASCII logo and the version the _faas-cli_ tool will be ready.

`faas-cli list`{{execute}}

**However**, _faas-cli_ cannot work until you login to the gateway. Commands like this will report _unauthorized access_.

At this point, there is an OpenFaaS gateway providing access to both the portal and REST API to manage the functions and OpenFaaS. Most of the CLI commands require this gateway as a parameter. To reduce the verbosity the gateway here is stored as an environment variable.

`export OPENFAAS_URL=https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

Notice the port 31112. This is the Kubernetes [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport) of the _external-gateway_ OpenFaaS service. The service can be see using this list command.

`kubectl get service --namespace openfaas`{{execute}}

With this gateway access, the first action is to login. We will use the same password that was submitted in the previous preparation step.

`faas-cli login --username admin --password="$PASSWORD"`{{execute}}

Now the list command will show an empty list found behind the gateway.

`faas-cli list`{{execute}}
