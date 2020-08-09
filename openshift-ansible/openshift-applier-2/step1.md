To get started, let us login to the OpenShift cluster by running the following:

``oc login -u developer -p developer``{{execute}}

For this tutorial we are going to create everything from scratch. In the future, in the future you can use some of the following resources as starting points:

* https://github.com/rht-labs/labs-ci-cd
* https://github.com/redhat-cop/containers-quickstarts

To begin, let's create a new directory and go into it.

``mkdir sample-applier; cd sample-applier``{{execute}}

```
cat <<EOM >requirements.yml
- name: openshift-applier
    scm: git
    src: https://github.com/redhat-cop/openshift-applier
    version: v3.9.0
EOM
```{{execute}}

To complete the generic project structure, we want to create the rest of these:

```
.
├── inventory
│   ├── group_vars
│   │   └── all.yml
│   ├── hosts
│   └── host_vars
│       ├── application.yml
│       └── bootstrap.yml
├── params
├── projectrequests
├── requirements.yml
└── templates
```

```
mkdir -p inventory/{group_vars,host_vars} params templates
touch inventory/group_vars/all.yml inventory/host_vars/{application.yml,bootstrap.yml} inventory/hosts
```{{execute}}

In the next step we'll start populating the inventory.