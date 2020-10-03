
Чтобы создать новый проект OpenShift, вы должны использовать команду **oc new-project**:

`oc new-project new-project1`{{execute}}

`oc new-project new-project2`{{execute}}

Эта команда создает новый проект и автоматически переключается на него. В нашем случае он переключается на new-project2.

Посмотрим на каком проекте стоит звездочка:

`oc projects`{{execute}}

 Мы можем вручную переключиться на другой доступный проект, выполнив команду **oc project**. Перейдем к проекту по умолчанию:

`oc project new-project1`{{execute}}

Посмотрим мы выбрали **new-project1**:

`oc projects`{{execute}}

Чтобы удалить проект OpenShift, вы можете использовать команду **oc delete**:

`oc delete project new-project1`{{execute}}

```
project "new-project1" deleted
```

Посмотрим удалился ли проект new-project1:

`oc projects`{{execute}}

 Мы можем вручную переключиться на другой доступный проект, выполнив команду **oc project**. Перейдем к проекту по умолчанию:

`oc project new-project2`{{execute}}

Посмотрим что, мы выбрали **new-project2**:

`oc projects`{{execute}}
