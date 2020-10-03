In this step, we will learn OpenShift CLI using the command _oc_.

Before we begin, make sure that your OpenShift is up and running. Run the folowing command to login to the OpenShift cluster
`oc login -u system:admin`{{execute}}

# Output

```
Login successful.

You don't have any projects. You can try to create a new project, by running

    oc new-project <projectname>
```

It is good practice to deploy an application in a separate namespace:
`oc new-project dockerfile`{{execute}}
