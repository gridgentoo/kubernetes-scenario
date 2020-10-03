Before we begin, make sure that your OpenShift is up and running. Run the folowing command to login to the OpenShift cluster
`oc login -u alice -p 1234`{{execute}}



# Output

```
Login successful.

You don't have any projects. You can try to create a new project, by running

    oc new-project <projectname>
```

To create a new project called ``advanced`` run the command:

`oc new-project advanced`{{execute}}

In this scenario, we will Autoscaling our application depending on CPU and RAM utilization using openshift pod autoscaler.
