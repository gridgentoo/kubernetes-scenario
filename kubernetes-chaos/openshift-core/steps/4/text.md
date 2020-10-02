When we use the oc command, it makes an API call to the OpenShift cluster using user credentials.

Let's quickly talk about each of user types in OpenShift. 

UserType | Description
--- | ---
`Regular users` | *A regular OpenShift user. Regular users are usually developers with access to OpenShift projects. Regular OpenShift user examples include user1.*
`system:admin` | *OpenShift cluster administrator user.*
`system:openshift-registry` | *OpenShift registry user.*


We can get information about the OpenShift user we are currently logged in as by using the oc whoami command:
`oc whoami`{{execute}}

In order to create a regular user, you can use the oc create user command:
`oc create user user1`{{execute}}

**Note:** We do not need to set a user password in this lab because our lab environment is set up to accept any password from any user.

By default, the user is going to be created for a project we are currently working on. To get the list of users, use the oc get users command:
`oc get users`{{execute}}

We should be able to see `user1`. 

The last essential things we need to learn is how to switch between different users. We can use the oc login command to do so:
`oc login -u developer -p 1234 --insecure-skip-tls-verify [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

You can access the `OpenShift Web Console` by clicking `Dashboard` tab located right to the terminal window.
