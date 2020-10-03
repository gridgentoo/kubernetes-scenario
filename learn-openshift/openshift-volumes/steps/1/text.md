In this step, we will learn OpenShift CLI using the command _oc_. We can deploy new applications in OpenShift cluster.

Run the folowing command to login as admin in the OpenShift cluster
``oc login -u system:admin``{{execute HOST1}}

# Output

```
You have access to the following projects and can switch between them with 'oc project <projectname>':

  * default
    kube-public
    kube-system
    openshift
    openshift-infra
```

# Openshift Project
Openshift Project is similar to the Kubernetes namespace which also supports access controls for different users.

To complete this step, create a new project called ``myproject`` using CLI.