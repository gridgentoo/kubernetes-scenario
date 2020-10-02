На этом этапе мы изучим интерфейс командной строки **OpenShift** с помощью команды **_oc_**.

Прежде чем мы начнем, убедитесь, что ваш **OpenShift** запущен и работает. Выполните следующую команду, чтобы войти в кластер **OpenShift**.
`oc login -u system:admin`{{execute}}

# Output

```
Авторизация успешна..

У вас нет проектов. Вы можете попробовать создать **new project**, запустив

    oc new-project <projectname>
```


**Openshift CLI** во многом похож на **Kubernetes CLI**.  
**oc** - это сокращение от **OpenShift client**, который работает аналогично **kubectl Kubernetes**. 
По мере продвижения вы обнаружите много общего между этими двумя командами.