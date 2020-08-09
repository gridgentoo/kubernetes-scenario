
## Давайте быстро настроим все, чтобы запустить приложение с новыми динамическими параметрами!

Сначала настроим файл** `hosts`**:

```
cat <<EOM >inventory/hosts
[seed-hosts]
localhost ansible_connection=local
EOM
```{{execute}}


и **playbook** как в прошлый раз:

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

Мы задействуем **pull**, роль **`openshift-applier`** с помощью **ansible-galaxy**!
```
cat <<EOM >requirements.yml
- name: openshift-applier
  scm: git
  src: https://github.com/redhat-cop/openshift-applier
  version: v2.0.10
EOM
```{{execute}}

А теперь запустим команду **ansible-galaxy**:
``ansible-galaxy install -r requirements.yml -p roles``{{execute}}

Наконец, запустим, run it!
``ansible-playbook -i inventory/ apply.yml``{{execute}}

Если это удастся **successful**, вы должны:

```
PLAY RECAP ***********************************
localhost                  : ok=18   changed=2
```

ПРИМЕЧАНИЕ: если вам нужно вспомнить, что мы делаем на этом этапе, обратитесь по этой ссылки [here](https://www.katacoda.com/kuber-ru/courses/openshift-ansible/openshift-applier)
