
Создайте **deployment nginx** с помощью **command** ниже

`kubectl run nginx --image=nginx`{{execute}}

Через несколько минут проверьте, задеплоино ли развертывание **nginx**

#### Проверьте **deployments status**

`kubectl get deployments`{{execute}}

**deployments** с именем **nginx** должно быть указано ниже

`
NAME   READY   UP-TO-DATE   AVAILABLE   AGE
nginx  1/1     1            1           13s
`

