Kubeless has a command-line interface (CLI) tool named appropriately `kubeless`. Use this tool to manage your functions on _Kubeless_. Let's get a recent Kubeless command-line interface (CLI) binary for this Linux account.

`curl -L http://github.com/kubeless/kubeless/releases/download/v1.0.3/kubeless_linux-amd64.zip -o kubeless.zip`{{execute}}

`unzip -Cj kubeless.zip "bundles/kubeless_linux-amd64/kubeless" -d /usr/local/bin`{{execute}}

This tool version will match the controller installed in the next step. Verify this CLI is working by inspecting its current version.

`kubeless --help && kubeless version`{{execute}}

## Kubeless Dashboard ##

There is also a user interface as an alternative way to manage _Kubeless_ and your functions.

Currently, it's on a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31000

`kubectl patch service my-kubeless-kubeless-ui --namespace=kubeless --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31000}]'`{{execute}}

Ideally this port adjustment should have happened when the Kubeless Helm chart was installed, but the chart currently does not allow the NodePort value to be specified. As a workaround, we adjust the port after installation with the above command. We can now point your browser to the service that serves up the Kubeless UI

The Kubeless UI is located as a tab above the command-line area or from this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/
