You can also perform a reverse operation—creating a template from existing resources. To do that, use the export command:
`oc export all --as-template=exported-template > exported-template.yml`{{execute}}

Let's delete our resources to prevent any conflicts:
`oc delete all --all`{{execute}}


And recreate them from the exported template:
`oc new-app -f exported-template.yml`{{execute}}

```
--> Deploying template "advanced/exported-template" for "exported-template.yml" to project advanced

--> Creating resources ...
    route "example-route" created
    pod "example-pod" created
    service "example-svc" created
--> Success
    Access your application via route 'example-route-advanced.openshift.example.com' 
    Run 'oc status' to view your app.
```

**Note:** You might have noticed that the web server was exposed through the same URL as before. This is because the exported template was created from already instantiated resources with all parameters resolved to values, so OpenShift has no way of knowing which fields were parameterized. You can also infer this from the output of the process command, which will show you that all the fields are already initialized. So, strictly speaking, this isn't a fully reverse operation, but it can be used for backups.

Now that we are finished, let's do a clean-up:
`oc delete all --all`{{execute}}

`oc delete template/example-template`{{execute}}