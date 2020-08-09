## Before we can run this, we need to create a playbook which will call the `openshift-applier`.

```
cat <<EOM >apply.yml
---
- name: Create Project and Ruby Example 
  hosts: "seed-hosts"
  tasks:
    - include_role:
        name: openshift-applier/roles/openshift-applier
EOM
```{{execute}} 

Next, we'll pull in the `openshift-applier` role using `ansible-galaxy`!