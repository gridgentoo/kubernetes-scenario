## Снова возьмем наши **templates**!

``oc get templates -n openshift``{{execute}}

Вы должны увидеть следующий **output**:
```
NAME                      DESCRIPTION               PARAMETERS    OBJECTS
projectrequest-template   ProjectRequest Template   3 (3 blank)   1
ruby-example-template                               1 (1 blank)   6
```

Сначала возьмем **Ruby Template**
```
oc export template ruby-example-template -n openshift -o yaml > templates/app/ruby.yml
```{{execute}}

А теперь получите **Project Template**
```
oc export template projectrequest-template -n openshift -o yaml > templates/project/projectrequest-template.yml
```{{execute}}
