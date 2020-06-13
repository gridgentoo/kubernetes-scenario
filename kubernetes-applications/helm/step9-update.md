Look at the service. Notice the service type is ClusterIP. To see the Nginx default page we would like to instead expose it as a NodePort. A kubectl _patch_ could be applied, but it would be best to change the values.yaml file. Perhaps this is just to verify. We could simply change the installed application with a new value. Use the Helm _upgrade_ command to modify the deployment.

`helm upgrade my-app ./app-chart --install --reuse-values --set service.type=NodePort`{{execute}}

Well, this demonstration chart is a bit deficient as it does not allow the values for the NodePort to be assigned. Right now it's a random value. We could modify the chart template to accept a nodePort value, but for this exercise apply this quick patch.

`kubectl patch service my-app-app-chart --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

With this adjustment my-app's [Nginx default page](https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/) will be reachable.
