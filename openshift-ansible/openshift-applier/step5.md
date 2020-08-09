## Now we also need to make sure our ruby template goes into our inventory as well:

```
echo "- object: ruby-components
  content:
  - name: ruby-ex
    template: \"{{ inventory_dir }}/../templates/app/ruby.yml\"
    params: \"{{ inventory_dir }}/../params/ruby/build\"
    namespace: \"ruby-example\"
    ignore_unknown_parameters: false
    tags:
      - app" >> inventory/group_vars/all.yml
```{{execute}}

Notice that we added the Project Request first, and the ruby template second.

The `openshift-applier` creates [object in the order](https://github.com/redhat-cop/openshift-applier/blob/master/roles/openshift-applier/README.md#ordering-of-objects-in-the-inventory) that they are placed, so we must make sure to create the Project first, and then the objects inside of that project!

Your `inventory/group_vars/all.yml` should now look like this:

```
---
ansible_connection: local

openshift_cluster_content:
- object: projects
  content:
  - name: dev
    template: "https://raw.githubusercontent.com/redhat-cop/cluster-lifecycle/master/files/projectrequest/template.yml"
    action: create
    params: "{{ inventory_dir }}/../params/projectrequests/project"
    tags:
      - projectrequests
      - projectrequests-dev
- object: ruby-components
  content:
  - name: ruby-ex
    template: "{{ inventory_dir }}/../templates/app/ruby.yml"
    params: "{{ inventory_dir }}/../params/ruby/build"
    namespace: "ruby-example"
    tags:
      - app
```{{}}