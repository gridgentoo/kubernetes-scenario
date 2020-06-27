
## Автодополнение ввода для Kubectl

Вы также можете использовать короткий псевдоним для `kubectl`, который можно интегрировать с автодополнениями:

```bash
alias k=kubectl
complete -F __start_kubectl k
```

Вы также можете использовать короткий псевдоним для **kubectl**, например **k config view**

`k config view`{{execute}}

нажмите ```clear```{{execute interrupt}} 

## Контекст и конфигурация kubectl

Установка того, с каким Kubernetes-кластером взаимодействует `kubectl` и изменяет конфигурационную информацию. Подробную информацию о конфигурационном файле смотрите на странице [Authenticating Across Clusters with kubeconfig](/docs/tasks/access-application-cluster/configure-access-multiple-clusters/).


показать объединённые настройки **kubeconfig**

`kubectl config view`{{execute}}

нажмите ```clear```{{execute interrupt}} 

сохранить пространство имен для всех последующих команд kubectl в этом контексте **namespace=ggckad-s2**. 

`kubectl config set-context --current --namespace=ggckad-s2`{{execute}}

`kubectl config view | grep "namespace:"`{{execute}}

установить контекст, используя имя пользователя и пространство имен.

`kubectl config set-context gce --user=cluster-admin --namespace=foo \
  && kubectl config use-context gce`{{execute}}

нажмите ```clear```{{execute interrupt}} 

`kubectl config view`{{execute}}

`kubectl config view | grep "namespace:"`{{execute}}

показать список контекстов

`kubectl config get-contexts`{{execute}}

показать текущий контекст (current-context)

`kubectl config current-context`{{execute}}

## добавить новую конфигурацию для кластера в kubeconf с базовой аутентификацией

`kubectl config set-credentials kubeuser/foo.kubernetes.com --username=kubeuser --password=kubepassword`{{execute}}

нажмите ```clear```{{execute interrupt}} 

`kubectl config view`{{execute}}

`kubectl config view | grep "name:"`{{execute}}

`kubectl config view | grep "user:"`{{execute}}

`kubectl config view | grep "namespace:"`{{execute}}



