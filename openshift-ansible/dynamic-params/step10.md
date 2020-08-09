## Because we haven't defined the variable `ruby_vars` yet!

Edit your `inventory/group_vars/all.yml` file and add this above `openshift_cluster_content`:

```
ruby_vars:
  NAMESPACE_BUILD: ruby-example
```{{copy}}

Your `inventory/group_vars/all.yml` should now look like this:

```
---
ansible_connection: local


ruby_vars:
  NAMESPACE_BUILD: ruby-example
  
openshift_cluster_content:
- object: projects
  content:
  - name: dev
    template: "https://raw.githubusercontent.com/redhat-cop/cluster-lifecycle/master/files/projectrequest/template.yml"
    action: create
    params_from_vars:
      NAMESPACE: ruby-example
      NAMESPACE_DISPLAY_NAME: "Ruby Example"
    tags:
      - projectrequests
      - projectrequests-dev
- object: ruby-components
  content:
  - name: ruby-ex
    template: "{{ inventory_dir }}/../templates/app/ruby.yml"
    params: "{{ inventory_dir }}/../params/ruby/build"
    params_from_vars: "{{ ruby_vars }}"
    namespace: "ruby-example"
    tags:
      - app
```{{}}

Run it one last time!
``ansible-playbook -i inventory/ apply.yml``{{execute}}

Don't forget to check out your app running in the console!