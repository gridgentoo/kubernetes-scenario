

Let's try to process it:
`oc process --parameters example-template`{{execute}}

```
NAME       DESCRIPTION             GENERATOR         VALUE
WEB_SERVER Web server image to use                   nginx
```

You can see the only parameter with the default value and description that you defined earlier.

Now, it's time to create a stack of resources from our template. This can be done by either piping the output of the process command to the create command, which we mentioned previously, or by using the new-app command. Let's start with the former approach:
`oc process example-template | oc create -f -`{{execute}}


As you can see, the create command just takes the list of resources and submits requests for their creation one-by-one to the API, so the output is similar to what you would see if you created three separate resource definitions and created resources from them manually.

But another way to instantiate a template gives you more information about what is going on. Let's delete the created resources first:
`oc delete all --all`{{execute}}


We don't have to delete the template as it's not going to change. Now, we can use the new-app command:
`oc new-app --template=example-template`{{execute}}

```
--> Deploying template "myproject/example-template" to project myproject

     example-template
     ---------
You chose to deploy nginx

     * With parameters:
        * Web Server=nginx

--> Creating resources ...
    pod "example-pod" created
    service "example-svc" created
    route "example-route" created
--> Success
    Access your application via route 'example-route-advanced.openshift.example.com' 
    Run 'oc status' to view your app.

`oc status
In project advanced on server https://172.24.0.11:8443

http://example-route-advanced.openshift.example.com (svc/example-svc)
  pod/example-pod runs nginx
```

As you can see, we created the pod, fronted it with the service, and exposed it through the route in just a single command. Notice that you don't need to run the oc get route  command to find out what URL your application is accessible through—it all shows in the output.

Let's see if our web server is reachable through curl:
`curl -I example-route-default.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

```
HTTP/1.1 200 OK
Server: nginx/1.15.1
```

Note
We used the -I parameter of the curl command to see only response headers, which is enough to check the responsiveness of the server and ensure that it doesn't dump raw HTML into the console. Also, just as before, we used -H option to request a specific application from OpenShift's router.

You can easily delete all of the resources and instantiate the template again, but this time with another web server image, such as Apache:
`oc delete all --all`{{execute}}