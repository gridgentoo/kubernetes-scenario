## Давайте сразу перейдем к динамическим параметрам!

Если вы помните из первого руководства, если мы объединяем **template** с файлом параметров, мы используем команду **`oc process`**.

```
oc process --local -f templates/app/ruby.yml --param-file params/ruby/build
```{{execute}}

Не смогли! **Failed**! Ох ... это потому, что на этот раз мы не используем статический файл **`params`**!

Чтобы использовать статический файл **`params`**, он выглядел так:
```
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
```{{}}

Обратите внимание на то, как он указывает на файл:
```
     template: "{{ inventory_dir }}/../templates/project/projectrequest-template.yml"
     params: "{{ inventory_dir }}/../params/projectrequests/project"
```{{}}


## Теперь давайте сделаем его динамичным!

Выполните эту команду, чтобы создать наш файл **group_vars**:

```
cat <<EOM >inventory/group_vars/all.yml
---
ansible_connection: local

openshift_cluster_content:
- object: projects
  content:
  - name: dev
    template: "{{ inventory_dir }}/../templates/project/projectrequest-template.yml"
    params_from_vars:
      NAMESPACE: ruby-example
      NAMESPACE_DISPLAY_NAME: "Ruby Example" 
    action: create
    tags:
      - projectrequests
      - projectrequests-dev
EOM
```{{execute}}

``nano inventory/group_vars/all.yml``{{execute}}

Вы должны заметить, что наш статический файл **`params`** стал:

```
    template: "{{ inventory_dir }}/../templates/project/projectrequest-template.yml"
    params_from_vars:
      NAMESPACE: ruby-example
      NAMESPACE_DISPLAY_NAME: "Ruby Example" 
```{{}}


Это круто! Почему? Потому что теперь мы можем использовать [**Ansible variables**](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html) для более динамичного использования!
