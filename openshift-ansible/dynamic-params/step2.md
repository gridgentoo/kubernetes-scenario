## Again let's get our templates! 

``oc get templates -n openshift``{{execute}}

You should see the following output:
```
NAME                      DESCRIPTION               PARAMETERS    OBJECTS
projectrequest-template   ProjectRequest Template   3 (3 blank)   1
ruby-example-template                               1 (1 blank)   6
```

First let's get the Ruby Template
```
oc export template ruby-example-template -n openshift -o yaml > templates/app/ruby.yml
```{{execute}}

And now get the Project Template
```
oc export template projectrequest-template -n openshift -o yaml > templates/project/projectrequest-template.yml
```{{execute}}
