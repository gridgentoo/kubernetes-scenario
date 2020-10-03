If pre-defined roles aren't sufficient, you can always create custom roles with just the specific rules you need. Let's create a custom role that can be used instead of the edit role to create and get pods:

`oc login -u system:admin`{{execute}}

`oc create clusterrole custom-role --verb=get,list,watch --resource=namespace,project`{{execute}}

Notice that we had to log in as cluster **administrator** to create a cluster role. A cluster role is required to make its users members of a particular project.

`oc delete clusterrole custom-role`{{execute}}