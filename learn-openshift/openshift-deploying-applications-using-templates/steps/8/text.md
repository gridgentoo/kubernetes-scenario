Exporting existing resources as templates
Existing OpenShift resources may be exported as templates by using the oc export command. Let's create a running application using oc new-app command first.


`oc new-app httpd`{{execute}}

`oc get all`{{execute}}

```
NAME             READY     STATUS    RESTARTS   AGE
httpd-1-dcm2d    1/1       Running   0          2s
httpd-1-deploy   1/1       Running   0          3s
```

`oc export dc,svc,route --as-template=myhttpd > myhttpd_template.yaml`{{execute}}


Once the template is created, you can see its contents:
`cat myhttpd_template.yaml | head -n 20`{{execute}}