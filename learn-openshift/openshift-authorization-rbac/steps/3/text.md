To see a list of all available cluster roles, run the following command:

`oc get clusterrole`{{execute}}

```
NAME
admin
basic-user
cluster-admin
...
<output omitted>
...
```


#### View
Use the describe command to understand what rules are in a particular role:
`oc describe clusterrole/edit`{{execute}}

You can see from the preceding output that, for example, users with this role can create and delete such resources as pods, configmaps, deploymentconfigs, imagestreams, routes, and services, but cannot do anything with projects, other than view them.

On the other hand, if you describe the view role, you will notice that the only actions allowed on resources are get,list, and watch, which makes it a perfect choice if, for example, you want to grant a development team the ability to view application resources in production, but not to modify any of them or create new resources:

`oc describe clusterrole/view`{{execute}}