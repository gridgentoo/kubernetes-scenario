The OpenShift community has developed many useful OpenShift templates, to deploy a number of well-known services. Once the template is determined, you will need to understand which parameters it accepts.

There are a couple of ways to list all of the parameters:

- Using the oc process --parameters command (this is the easiest one)
- Looking for the parameters section in the template's definition

Among many others, the OpenShift default installation comes with the mariadb-persistent template, as shown here:
`oc get template mariadb-persistent -n openshift`{{execute}}

```
NAME  DESCRIPTION  PARAMETERS OBJECTS
mariadb-persistent MariaDB database service, with persistent storage. For more information about... 8 (3 generated) 4
```


That template has a number of parameters:
`oc process --parameters -n openshift mariadb-persistent`{{execute}}

If you don't want to import the template into OpenShift, the same method allows you to display the parameters of a locally stored OpenShift template:


`oc process --parameters -f mytemplate.yaml`{{execute}}

```
NAME        DESCRIPTION  GENERATOR    VALUE
SHOW_DATA   Myapp configuration data
```

Another method is to use the oc describe command:
`oc describe template template1`{{execute}}
