Once available, you can exercise the service two ways. First, simply from the command line,

`curl https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

You can also watch the sidecar continuously update the Nginx static web page with an accumulating timestamp.

`while true; do sleep 1; curl -s https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com | tail -2; done;`{{execute}}

Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

The same Nginx output from the `sidecar-pod` can also be seen in your browser from the _sidecar-pod_ tab above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com

As an alternative to the kubectl CLI you can also observe the Pod logs in the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/). Use this script to access the protected Dashboard.

`token.sh`{{execute}}
