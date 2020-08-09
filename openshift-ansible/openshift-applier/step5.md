## Теперь нам также нужно убедиться, что наш **ruby template** тоже попал в наш **inventory**:

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

Notice >> Обратите внимание, что мы добавили сначала **Project Request**, а затем **ruby template**.

**`openshift-applier` **создает [объект в порядке](https://github.com/redhat-cop/openshift-applier/blob/master/roles/openshift-applier/README.md#ordering-of-objects-in-the-inventory) что они размещены, поэтому мы должны сначала создать проект **Project first**, а затем объекты внутри этого проекта!

Ваш **`inventory/group_vars/all.yml`** теперь должен выглядеть так:
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