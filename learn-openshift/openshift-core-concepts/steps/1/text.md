На этом шаге мы изучим интерфейс командной строки OpenShift CLI с помощью команды **_oc_**.

Прежде чем мы начнем, убедитесь, что наш OpenShift запущен и работает. 

Выполните следующую команду, чтобы войти в кластер OpenShift.

`oc login -u system:admin`{{execute}}

# Output

```
Login successful.

You don't have any projects. You can try to create a new project, by running

    oc new-project <projectname>
```

**Openshift CLI** во многом похож на **Kubernetes CLI**. 

**oc** - это сокращение от **OpenShift client**, который работает аналогично **kubectl Kubernetes**. 
По мере продвижения вы обнаружите много общего между этими двумя командами.