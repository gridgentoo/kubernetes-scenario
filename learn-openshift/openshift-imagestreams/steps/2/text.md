Log in as an unprivileged user:
`oc login -u alice -p 1234 --insecure-skip-tls-verify [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

```
Username: alice
Password: 1234
Login successful.
```

**Note:** Remember that since this time we didn't configure identity provider explicitly, OpenShift defaults to AllowAll, so we can use any password.

Next, create a dedicated project for our lab:
`oc new-project advanced`{{execute}}