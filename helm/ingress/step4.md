#### Чтобы получить доступ к **deployment nginx** нам нужно создать **Service**

**Execute** команду ниже, чтобы создать **Service**

`kubectl create -f service.yaml`{{execute}}

#### Проверьте **Service**
`kubectl get svc`{{execute}}

**Service** с именем **nginx** должен быть указан ниже
`
NAME       TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE
...
nginx      NodePort       10.102.194.141   <none>        80:32462/TCP                 19s
`

## Деплоймент доступа **nginx**
Для доступа к **deployment nginx** через порт 80 создайте **ingress** с определенным путем **test**
затем он может получить доступ к **nginx** через **url pattern**, такой как
http://xxxxx/test/

#### Создайте **Ingress** через **command**
`kubectl create -f ingress.yaml`{{execute}}


#### Проверьте Ingress
`kubectl get ingress`{{execute}}

`
NAME           HOSTS   ADDRESS   PORTS   AGE
test-ingress   *                 80      53s
`

#### Доступ к приложению после деплоя **Ingress**

[Access Application](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/test/)

