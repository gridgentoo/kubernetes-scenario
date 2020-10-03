In this step, we will learn OpenShift CLI using the command _oc_.

Before we begin, make sure that your OpenShift is up and running. Let's login as system:admin user since managing quotas & limits requires admin privileges:
`oc login -u system:admin`{{execute}}

# Output

```
Login successful.

You don't have any projects. You can try to create a new project, by running

    oc new-project <projectname>
```

To create a new project called ``advanced`` run the command:

`oc new-project advanced`{{execute}}

One of the main ideas behind OpenShift projects in multi-tenant environments is the need to limit resource consumption at a more granular level than just a whole cluster, providing operations with the ability to scope such limitations to organizations and departments.

OpenShift provides two mechanisms for setting limits on resource consumption in a cluster:
- ResourceQuota
- LimitRanges