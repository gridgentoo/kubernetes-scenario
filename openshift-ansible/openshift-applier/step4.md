## Чтобы объединить **template** с файлом параметров, мы используем команду **`oc process`**.

```
oc process --local -f templates/app/ruby.yml --param-file params/ruby/build
```{{execute}}

Это не помещает делать **output** в **OpenShift**, а только проверяет правильность **validates** вашего шаблона **template** и **params** и показывает **output**. 

Если все выглядит хорошо, и вы хотите поместить это в **OpenShift**, ваша команда будет выглядеть так: `oc process -f templates/app/ruby.yml --param-file params/ruby/build | oc apply -f -` (ЭТО ПРИМЕР, НЕ ЗАПУСКАЙТЕ)

Это мощная команда **command**, которая обеспечит создание вашего **template** и всех его частей в OpenShift. 
Именно это позволяет вам делать **`openshift-applier`** **role** с помощью Ansible!

Теперь, чтобы выполнить ту же самую команду с помощью **`openshift-applier`**, нам нужно создать **`openshift_cluster_content`**, чтобы сообщить ему, какие **templates** и параметры использовать.

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


``nano inventory/group_vars/all.yml``{{execute}}


**`openshift-applier`** также может извлекать **templates** из **raw GitHub URLs** в дополнение к использованию локальных файлов!

Чтобы узнать больше об объекте **`openshift_cluster_content`**, перейдите [сюдя](https://github.com/redhat-cop/openshift-applier/blob/v2.0.0/roles/openshift-applier/README.md)!

