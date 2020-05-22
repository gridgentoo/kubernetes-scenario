Before containers can consume contextual configuration data, that data must first be created and stored in ConfigMaps. In later steps the same will be done slightly differently for Secrets.

A ConfigMap is simple data associated with a unique key.

## Create ConfigMap from CLI ##

Use the kubectl tool to _create_ two manually entered data items with a key called _mountains_.

`kubectl create configmap mountains --from-literal=aKey=aValue --from-literal=14ers=www.14ers.com`{{execute}}

Check Kubernetes using _get_ after the _create_ and it will indicate 2 for _DATA_ associated with _mountains_.

`kubectl get configmap mountains`{{execute}}

To see the actual data, _get_ it in YAML form.

`kubectl get configmap mountains -o yaml`{{execute}}

Or, in description form

`kubectl describe configmap mountains`{{execute}}

Finally, to complete CRUD operations _delete_ the _mountains_.

`kubectl delete configmap mountains`{{execute}}

OK, your right, we skipped the update of CRUD. From the CLI one way to achieve this is to _delete_ the resource and _create_ it again with the new values.

## Create from YAML ##

A better way to define ConfigMaps is with a resource YAML file in this form.

`cat ucs-org.yaml`{{execute}}

The same _create_ command can be used to submit a YAML resource file.

`kubectl create -f ucs-org.yaml`{{execute}}

Then, view it.

`kubectl describe configmap ucs-info`{{execute}}

The same ConfigMaps can also be explored in the [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/).

## Three Access Techniques ##

Once the configuration data is stored in ConfigMaps, the containers can access the data. Pods grant their containers access to the ConfigMaps through these three techniques:

- through the application command-line arguments,
- through the system environment variables accessible by the application,
- through a specific read-only file accessible by the application.

The next steps, explore these access techniques.
