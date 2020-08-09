## Now we need the our [openshift-applier](https://github.com/redhat-cop/openshift-applier) role from GitHub, let's create the `requirements.yml` file

```
cat <<EOM >requirements.yml
- name: openshift-applier
  scm: git
  src: https://github.com/redhat-cop/openshift-applier
  version: v2.0.3
EOM
```{{execute}}

First pull down the `openshift-applier` role from the ansible-galaxy requirements into the `roles` directory:

``ansible-galaxy install -r requirements.yml -p roles``{{execute}}

Finally, let's run it!

``ansible-playbook -i inventory/ apply.yml``{{execute}}

If that is successful you should be:

```
PLAY RECAP ***********************************
localhost                  : ok=29   changed=2
```

