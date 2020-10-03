Once a template is developed, it can be added to OpenShift like any other YAML or JSON-defined objects, using the oc create command. It is a common practice to use a separate tenant specifically for templates, which will be shared between multiple projects. A default installation of the Red Hat OpenShift Container Platform (OCP) provides a number of templates in the openshift project. All of an OpenShift cluster's users have read access to the project, but only the cluster admin is able to modify or create templates in the project.

The following example shows how to add a template to your current project:

`oc create -f mytemplate.yaml`{{execute}}

`oc get template`{{execute}}

```
NAME        DESCRIPTION    PARAMETERS    OBJECTS
template1                  1 (1 blank)   1
```

You will need to `system:admin` user to create a template in the openshift tenant:
`oc create -f mytemplate.yaml -n openshift`{{execute}}

`oc get template -n openshift|grep temp`{{execute}}
