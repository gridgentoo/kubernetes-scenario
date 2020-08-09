For this tutorial, we are going to use an existing Ruby template. In many cases you may want your own custom template, but the process is the same.

First you'll need to find the name of the template you want to pull in:

``oc get templates -n openshift``{{execute}}

You should see the following output:
```
NAME                    DESCRIPTION   PARAMETERS    OBJECTS
ruby-example-template                 1 (1 blank)   6
```

`ruby-example-template` is the name of the template we're going to pull down as a template file into the `templates` directory.

```
mkdir templates/app
oc export template ruby-example-template -n openshift -o yaml > templates/app/ruby.yml
```{{execute}}

To checkout what the template looks like, run the following:

``cat templates/app/ruby.yml``{{execute}}

You'll notice at the end of the template, there is a parameters section with only parameter: `BUILD_NAMESPACE`. We'll want to create a parameter file to set this value.

```
mkdir params/ruby
echo 'BUILD_NAMESPACE=ruby-example' > params/ruby/build
```{{execute}}


Next we need to create the `openshift_cluster_content` to tell it to create OpenShift objects from the template and parameters.

You can learn more details about this [here](https://github.com/redhat-cop/openshift-applier/blob/master/roles/openshift-applier/README.md).

```
cat <<EOM >inventory/host_vars/application.yml
---
ansible_connection: local
openshift_cluster_content:
- object: ruby-components
    content:
    - name: ruby-ex
      template: "{{ playbook_dir }}/templates/app/ruby.yml"
      params: "{{ playbook_dir }}/params/ruby/build"
      namespace: "{{ ruby_namespace }}"
      tags:
      - app
EOM
```{{execute}}

Awesome, we're almost ready to run this! First we need to create the OpenShift project/namespace where the application will run.

```
mkdir params/projectrequests
cat <<EOM >params/projectrequests/project
NAMESPACE=ruby-example
NAMESPACE_DISPLAY_NAME="Ruby Example"
EOM
```{{execute}}

```
cat <<EOM >inventory/host_vars/bootstrap.yml
---
ansible_connection: local
openshift_cluster_content:
- object: projects
    content:
    - name: dev
      template: "https://raw.githubusercontent.com/redhat-cop/cluster-lifecycle/master/files/projectrequest/template.yml"
      template_action: create
      params: "{{ playbook_dir }}/params/projectrequests/project"
      tags:
      - projectrequests
      - projectrequests-dev
EOM
```{{execute}}

To finish up the inventory, we need to update the hosts file to include the host_vars we just created.

```
cat <<EOM >inventory/hosts
[bootstrap]
bootstrap

[application]
application
EOM
```{{execute}}

In the next step we'll create the playbook and then run it.