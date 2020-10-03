For now, run the following command to correct this.

`oc login -u system:admin`{{execute}}


`oc delete po/nginx`{{execute}}


`oc adm policy add-scc-to-user anyuid -z default`{{execute}}

```
scc "anyuid" added to: ["system:serviceaccount:alice-project:default"]
```

#### Login as Bob
`oc login -u bob`{{execute}}

And now it works:
`oc create -f nginx-pod.yml`{{execute}}

`oc get po`{{execute}}