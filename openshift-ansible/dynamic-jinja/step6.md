## Теперь нам также нужно убедиться, что наш **ruby template** тоже попал в наш **inventory**:

```
echo "- object: ruby-components
  content:
  - name: ruby-ex
    template: \"{{ inventory_dir }}/../templates/app/ruby.yml\"
    params: \"{{ inventory_dir }}/../params/ruby/build\"
    params_from_vars:
      NAMESPACE_BUILD: not-a-ruby-example
    namespace: \"ruby-example\"
    tags:
      - app" >> inventory/group_vars/all.yml
```{{execute}}

Notice: Обратите внимание, что есть как **`params`** , так и **`params_from_vars`**:
```
    params: \"{{ inventory_dir }}/../params/ruby/build\"
    params_from_vars:
      NAMESPACE_BUILD: not-a-ruby-example
```{{}}

**`openshift-applier`** перечислит **enumerate** в команде как файл **`params`**, так и **`params_from_vars`**!

Это будет выглядеть так:
```
oc process  --local  -f /root/sample-applier/inventory/../templates/app/ruby.yml -n ruby-example  --param='NAMESPACE_BUILD=not-a-ruby-example'  --param-file=/root/sample-applier/params/ruby/build  | oc apply -n ruby-example -f -
```{{}}

Все, что является **`--param`**, перезапишет соответствующий ключ **matching key**, найденный в файле параметров, указанном с помощью **`--param-file`**!