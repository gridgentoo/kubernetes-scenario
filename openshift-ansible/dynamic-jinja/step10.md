## Потому что мы еще не определили **defined**  переменную **`ruby_vars`**!

Отредактируйте свой файл **`inventory/group_vars/all.yml`** и добавьте его выше **`openshift_cluster_content`**:

```
ruby_vars:
  NAMESPACE_BUILD: ruby-example
```{{copy}}

Ваш **`inventory/group_vars/all.yml`** теперь должен выглядеть так::

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

Запустите его в последний раз!
``ansible-playbook -i inventory/ apply.yml``{{execute}}

Не забудьте проверить свое приложение, запущенное в консоли!