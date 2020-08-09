## Теперь нам нужна наша роль [openshift-applier](https://github.com/redhat-cop/openshift-applier) **role** из **GitHub**, давайте создадим файл **`requirements.yml`** 
```
cat <<EOM >requirements.yml
- name: openshift-applier
  scm: git
  src: https://github.com/redhat-cop/openshift-applier
  version: v2.0.3
EOM
```{{execute}}

``nano requirements.yml``{{execute}}

Сначала перетащите роль **pull down** - **`openshift-applier`** **role** из требований **ansible-galaxy** requirements в каталог **`roles`**:

``ansible-galaxy install -r requirements.yml -p roles``{{execute}}

Наконец, запустим, run it!

``ansible-playbook -i inventory/ apply.yml``{{execute}}

Если это удастся **successful**, вы должны увидеть:

```
PLAY RECAP ***********************************
localhost                  : ok=29   changed=2
```

