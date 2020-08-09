## Now we also need to make sure our ruby template goes into our inventory as well:

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

Notice there are both `params` and `params_from_vars`:
```
    params: \"{{ inventory_dir }}/../params/ruby/build\"
    params_from_vars:
      NAMESPACE_BUILD: not-a-ruby-example
```{{}}

The `openshift-applier` will enumerate both the `params` file and the `params_from_vars` onto the command!

It will look like this:
```
oc process  --local  -f /root/sample-applier/inventory/../templates/app/ruby.yml -n ruby-example  --param='NAMESPACE_BUILD=not-a-ruby-example'  --param-file=/root/sample-applier/params/ruby/build  | oc apply -n ruby-example -f -
```{{}}

Anything that is `--param` will overwrite a matching key found in the params file specified using `--param-file`!