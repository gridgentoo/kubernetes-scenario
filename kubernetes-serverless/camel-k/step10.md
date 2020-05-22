There really is no need to cleanup with Katacoda but if your were running this tutorial with another type of Kubernetes cluster it would be good to clean up this work.

Since Camel K was installed with the Helm package manager, it can be deleted by referencing the installation name.

All control plane components can be cleaned up with:

`kubectl delete all,pvc,configmap,rolebindings,clusterrolebindings,secrets,sa,roles,clusterroles,crd -l 'app=camel-k'`{{execute}}
