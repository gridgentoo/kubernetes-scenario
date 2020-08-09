## В этом руководстве мы собираемся использовать существующий шаблон **Ruby OpenShift Template**. 

Во многих случаях вам может понадобиться собственный настраиваемый шаблон, но процесс остается прежним. Чтобы узнать больше о шаблонах **OpenShift Templates**, перейдите [here](https://docs.openshift.com/container-platform/3.10/dev_guide/templates.html).

Сначала вам нужно найти имя шаблона **template**, который вы хотите вставить **pull in**:

``oc get templates -n openshift``{{execute}}

Вы должны увидеть следующий результат:

```
NAME                      DESCRIPTION               PARAMETERS    OBJECTS
projectrequest-template   ProjectRequest Template   3 (3 blank)   1
ruby-example-template                               1 (1 blank)   6
```

**`ruby-example-template`** это имя шаблона **template**, который мы собираемся загрузить как **pull down** как **template file** в каталог **`templates`** directory.
**`projectrequest-template`** это имя шаблона **template** который мы собираемся использовать для создания проекта, в котором будет работать наше приложение **Ruby App** 

Сначала возьмем шаблон **Ruby**

```
oc export template ruby-example-template -n openshift -o yaml > templates/app/ruby.yml
```{{execute}}

А теперь получите шаблон проекта **Project Template**

```
oc export template projectrequest-template -n openshift -o yaml > templates/project/projectrequest-template.yml
```{{execute}}

Чтобы проверить, как выглядит шаблон **Ruby template**, выполните следующее:

``cat templates/app/ruby.yml``{{execute}}
