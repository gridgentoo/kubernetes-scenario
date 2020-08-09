## To finish up the inventory, we need to update the hosts file

Because the `openshift-applier` uses your local `oc` client, it will target `localhost` when we run.

```
cat <<EOM >inventory/hosts
[seed-hosts]
localhost ansible_connection=local
EOM
```{{execute}}

In the next step we'll create the playbook!