Let's build the application from source code by instantiating that template with its APPLICATION_NAME=wordpress:
`oc new-app -f wordpress-quickstart/templates/classic-standalone.json -p APPLICATION_NAME=wordpress`{{execute}}


You may want to check the build logs for WordPress application:
`oc logs bc/wordpress -f`{{execute}}

**Note:** Press `Ctrl` + `C` to exit the log console.

```
Cloning "https://github.com/openshift-evangelists/wordpress-quickstart" ...
  Commit: 0f5076fbb3c898b77b820571fa30d1293c3ac33b (Update README with details on how to enable WebDav access.)
...
<output omitted>
...
Pushed 9/10 layers, 96% complete
Pushed 10/10 layers, 100% complete
Push successful
```

After some time, all WordPress pods will be up and running, as shown as follows:
`oc get pods`{{execute}}

**Note:** Please wait for the wordpress deployment to complete and all the pods to be running, It will take around **3 minutes** to complete.