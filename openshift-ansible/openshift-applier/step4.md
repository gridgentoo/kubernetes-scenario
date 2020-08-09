## To combine a template with a parameters file, we use the `oc process` command. 

```
oc process --local -f templates/app/ruby.yml --param-file params/ruby/build
```{{execute}}

This does not put the output into OpenShift, it only validates that your template and params are correct and shows you the output.

If everything looks good, and you want to put it into OpenShift, your command would look like this: `oc process -f templates/app/ruby.yml --param-file params/ruby/build | oc apply -f -` (THIS IS AN EXAMPLE, DO NOT RUN)

This is a powerful command that will ensure your template and all of it's pieces have been created in OpenShift. And this is precisely what the `openshift-applier` role allows you to do using Ansible!

Now, to execute that same command using the `openshift-applier` we need to create `openshift_cluster_content` to tell it which templates and parameters to use.

```
cat <<EOM >inventory/group_vars/all.yml
---
ansible_connection: local

openshift_cluster_content:
- object: projects
  content:
  - name: dev
    template: "{{ inventory_dir }}/../templates/project/projectrequest-template.yml"
    params: "{{ inventory_dir }}/../params/projectrequests/project"
    action: create
    ignore_unknown_parameters: false
    tags:
      - projectrequests
      - projectrequests-dev
EOM
```{{execute}}

The `openshift-applier` can also pull templates down from raw GitHub URLs in addition to using local files!

To learn more about the `openshift_cluster_content` object, go [here](https://github.com/redhat-cop/openshift-applier/blob/v2.0.0/roles/openshift-applier/README.md)!

