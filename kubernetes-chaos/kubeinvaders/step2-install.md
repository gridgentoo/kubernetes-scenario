Create a namespace for the game application.

`kubectl create namespace kubeinvaders`{{execute}}

Grab the source code that contains the Helm chart.

`git clone https://github.com/lucky-sideburn/KubeInvaders && cd KubeInvaders`{{execute}}

Install the game using the Helm chart.

```
helm install kubeinvaders ./helm-charts/kubeinvaders \
--version 0.1.1 \
--namespace kubeinvaders \
--set service.type=NodePort \
--set ingress.enabled=false \
--set target_namespace="default\,more-apps" \
--set route_host=[[HOST_SUBDOMAIN]]-30016-[[KATACODA_HOST]].environments.katacoda.com
```{{execute}}

Change the service NodePort value to the same one specified as the Helm chart parameter. (This is a workaround as the Helm chart does not currently have the ability to specify the NodePort value.)

`kubectl patch service kubeinvaders -n kubeinvaders --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30016}]'`{{execute}}
