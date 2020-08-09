## Let's change your `inventory/group_vars/all.yml` file:

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

Notice that we changed this part:
```
    params_from_vars: "{{ ruby_vars }}"
```{{}}

Run the applier again!
``ansible-playbook -i inventory/ apply.yml``{{execute}}

It failed again! Why?