## Давайте изменим наш файл **`inventory/group_vars/all.yml`**:

```
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

Обратите внимание, что мы изменили эту часть:
```
    params_from_vars: "{{ ruby_vars }}"
```{{}}

Запустите **applier** снова!
``ansible-playbook -i inventory/ apply.yml``{{execute}}

Опять не удалось, It **failed** again! Почему?