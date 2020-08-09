## For this tutorial, we are going to use an existing Ruby OpenShift Template. 

In many cases you may want your own custom template, but the process is the same. To learn more about OpenShift Templates, go [here](https://docs.openshift.com/container-platform/3.10/dev_guide/templates.html).

First you'll need to find the name of the template you want to pull in:

``oc get templates -n openshift``{{execute}}

You should see the following output:
```
NAME                      DESCRIPTION               PARAMETERS    OBJECTS
projectrequest-template   ProjectRequest Template   3 (3 blank)   1
ruby-example-template                               1 (1 blank)   6
```

`ruby-example-template` is the name of the template we're going to pull down as a template file into the `templates` directory.
`projectrequest-template` is the name of the template we're going to use to create the project in which our Ruby App will run.

First let's get the Ruby Template
```
oc export template ruby-example-template -n openshift -o yaml > templates/app/ruby.yml
```{{execute}}

And now get the Project Template
```
oc export template projectrequest-template -n openshift -o yaml > templates/project/projectrequest-template.yml
```{{execute}}

To checkout what the Ruby template looks like, run the following:

``cat templates/app/ruby.yml``{{execute}}
