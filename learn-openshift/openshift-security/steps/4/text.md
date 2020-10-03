The service account can be created with a simple command:
`oc create sa myserviceaccount`{{execute}}

Let's delete it for now, as we will be creating it again later on in this chapter:
`oc delete sa/myserviceaccount`{{execute}}

```
serviceaccount "myserviceaccount" deleted
```

Every service account is also a member of two groups:

**system:serviceaccounts** which includes all service accounts in the cluster.

**system:serviceaccounts:<project>** which includes all service accounts in the project.

You can grant privileges to groups of service accounts, which will effectively grant those privileges to all accounts in the group. For example, to grant view privileges to all service accounts in the cluster in the project myproject, type the following command:

`oc new-project myproject`{{execute}}

`oc adm policy add-role-to-group view system:serviceaccounts -n myproject`{{execute}}

We specified -n only as a demonstration; as your current project is myproject, you could have omitted it.

Let's revert our changes and learn how to remove a particular role from a user in the process:
`oc adm policy remove-role-from-group view system:serviceaccounts -n myproject`{{execute}}
