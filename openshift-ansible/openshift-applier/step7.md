## Прежде чем мы сможем запустить это, нам нужно создать **playbook**, который будет вызывать **`openshift-applier`**.

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


``nano apply.yml``{{execute}}


Затем мы подключим **pull in** the **`openshift-applier`** **role** с помощью **`ansible-galaxy`**!
