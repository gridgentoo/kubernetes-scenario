OpenShift project is a Kubernetes namespace with additional features called annotations that provide user multi-tenancy and role-based access control in OpenShift. Each project has its own set of policies, constraints, and service accounts. You can see that the number of namespaces and projects in OpenShift is the same. The commands we are going to need are oc get namespaces and oc get projects:
`oc get projects`{{execute}}

`oc get namespaces`{{execute}}

As we mentioned previously, each namespace, or rather project, is separated from another by a set of rules. This allows different teams to work independently from each other. In order to identify what project we are currently working in, you can use the oc projects command. This command gives you a list of OpenShift projects available for you, and it also tells you what projects you are currently working on:
`oc projects`{{execute}}

```
You have access to the following projects and can switch between them with 'oc project <projectname>':
    default
    kube-public
    kube-system
    myproject - My Project
  * new-project1
    openshift
    openshift-infra
    openshift-node
Using project "new-project1" on server "https://127.0.0.1:8443".
```

**Note:** The asterisk * also specifies the current project.We can see that there are a lot of different projects available, though we have not created any because the system admin user has access to everything. 