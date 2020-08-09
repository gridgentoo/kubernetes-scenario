## This part should look familiar, BUT THERE'S A DIFFERENCE!

Like last time, these parameters match up with each Template to create a list of OpenShift objects...

But this time we will use them as our defaults!

Let's create a parameter file to set this value:

```
echo 'NAMESPACE_BUILD=ruby-example' > params/ruby/build
```{{execute}}

Notice the parameter values are different than step 3! 

Go ahead and run it again:
``ansible-playbook -i inventory/ apply.yml``{{execute}}



