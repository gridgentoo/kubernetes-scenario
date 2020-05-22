To get a more detailed description of a specific resource object, you can use the ``oc describe`` command.

Run:

``oc describe route/parksmap``{{execute}}

and it should yield something similar to:

```
Name:                   parksmap
Namespace:              myproject
Created:                5 minutes ago
Labels:                 app=parksmap
Annotations:            openshift.io/host.generated=true
Requested Host:         parksmap-myproject.2886795273-80-frugo03.environments.katacoda.com
                          exposed on router default (host apps-crc.testing) 5 minutes ago
Path:                   <none>
TLS Termination:        <none>
Insecure Policy:        <none>
Endpoint Port:          8080-tcp

Service:        parksmap
Weight:         100 (100%)
Endpoints:      10.128.0.220:8080
```

Whenever passing a specific resource object as argument to an ``oc`` command, there are two conventions which can be used. The first is to use a single string of the form ``type/name``. The second is to pass the ``type`` and ``name`` as separate consecutive arguments. The command:

``oc describe route parksmap``{{execute}}

is therefore equivalent.

The output produced by ``oc describe`` is intended to be a human readable format. To get the raw object details as JSON or YAML, you can use the ``oc get`` command, listing the name of the resource and the output format.

For JSON output, you can use:

``oc get route/parksmap -o json``{{execute}}.

For YAML output, you can use:

``oc get route/parksmap -o yaml``{{execute}}.

To see a description of the purpose of specific fields in the raw object, you can use the ``oc explain`` command, providing it with a path selector for the field.

To see the description of the ``host`` field of the ``spec`` object, you can run:

``oc explain route.spec.host``{{execute}}

This will output:

```
KIND:     Route
VERSION:  route.openshift.io/v1

FIELD:    host <string>

DESCRIPTION:
     host is an alias/DNS that points to the service. Optional. If not specified
     a route name will typically be automatically chosen. Must follow DNS952
     subdomain conventions.
```
