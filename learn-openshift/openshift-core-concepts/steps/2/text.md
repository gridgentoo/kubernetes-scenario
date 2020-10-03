Проект OpenShift - это  Kubernetes namespace с дополнительными функциями, называемыми аннотациями **annotations**, которые обеспечивают многопользовательский режим и управление доступом на основе ролей  **role-based access** в OpenShift. Каждый проект имеет собственный набор политик, ограничений и учетных записей служб. Как видите, количество пространств имен и проектов в OpenShift одинаковое. Нам понадобятся команды **oc get namespaces** и **oc get projects**:

`oc get projects`{{execute}}

`oc get namespaces`{{execute}}

Как мы упоминали ранее, каждое пространство имен или, скорее, проект отделен от другого набором правил **set of rules**. Это позволяет различным командам работать независимо друг от друга. Чтобы определить, над каким проектом мы сейчас работаем, вы можете использовать команду **oc projects**. Эта команда дает вам список доступных вам проектов OpenShift, а также сообщает, над какими проектами вы сейчас работаете:


`oc projects`{{execute}}

```
You have access to the following projects and can switch between them with 'oc project <projectname>':
    default
    kube-public
    kube-system
    myproject - My Project
  * new-project1
    openshift
    openshift-infra
    openshift-node
Using project "new-project1" on server "https://127.0.0.1:8443".
```

**Note:** Звездочка * также указывает на текущий проект. Мы видим, что доступно множество различных проектов, но мы не создали ни одного, потому что системный администратор имеет доступ ко всему.

