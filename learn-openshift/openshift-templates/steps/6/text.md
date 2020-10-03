

`oc new-app --template=example-template -p WEB_SERVER=httpd`{{execute}}

```
--> Deploying template "myproject/example-template" to project myproject

     example-template
     ---------
You chose to deploy httpd
...
<output omitted>
...
    Access your application via route 'example-route-advanced.openshift.example.com' 
    Run 'oc status' to view your app.
```

`curl -I example-route-advanced.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}