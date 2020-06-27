
Прежде чем исследовать темы наблюдаемости **observability**, запустите небольшое приложение, чтобы предоставить что-то для наблюдения **observe**.

Запустите 3 экземпляра контейнера **random-logger**, чтобы начать генерировать непрерывно случайные **logging events**.

`kubectl create deployment random-logger --image=chentex/random-logger`{{execute}}

## Автодополнение ввода для Kubectl

### BASH

```bash
source <(kubectl completion bash) # настройка автодополнения в текущую сессию bash, предварительно должен быть установлен пакет bash-completion .
echo "source <(kubectl completion bash)" >> ~/.bashrc # добавление автодополнения autocomplete постоянно в командную оболочку bash.
```

Вы также можете использовать короткий псевдоним для `kubectl`, который можно интегрировать с автодополнениями:

```bash
alias k=kubectl
complete -F __start_kubectl k
```

Вы также можете использовать короткий псевдоним для **kubectl**, например **k config view**

`k config view`{{execute}}

## Контекст и конфигурация kubectl

Установка того, с каким Kubernetes-кластером взаимодействует `kubectl` и изменяет конфигурационную информацию. Подробную информацию о конфигурационном файле смотрите на странице [Authenticating Across Clusters with kubeconfig](/docs/tasks/access-application-cluster/configure-access-multiple-clusters/).


```bash
kubectl config view # показать объединённые настройки kubeconfig

# использовать несколько файлов kubeconfig одновременно и посмотреть объединённую конфигурацию из этих файлов
KUBECONFIG=~/.kube/config:~/.kube/kubconfig2

kubectl config view

# получить пароль для пользователя e2e
kubectl config view -o jsonpath='{.users[?(@.name == "e2e")].user.password}'

kubectl config view -o jsonpath='{.users[].name}'    # показать первого пользователя
kubectl config view -o jsonpath='{.users[*].name}'   # получить список пользователей
kubectl config get-contexts                          # показать список контекстов
kubectl config current-context                       # показать текущий контекст (current-context)
kubectl config use-context my-cluster-name           # установить my-cluster-name как контекст по умолчанию

# добавить новую конфигурацию для кластера в kubeconf с базовой аутентификацией
kubectl config set-credentials kubeuser/foo.kubernetes.com --username=kubeuser --password=kubepassword

# сохранить пространство имен для всех последующих команд kubectl в этом контексте.
kubectl config set-context --current --namespace=ggckad-s2

# установить контекст, используя имя пользователя и пространство имен.
kubectl config set-context gce --user=cluster-admin --namespace=foo \
  && kubectl config use-context gce

kubectl config unset users.foo                       # удалить пользователя foo
```

показать объединённые настройки **kubeconfig**

`kubectl config view`{{execute}}

нажмите ```clear```{{execute interrupt}} 

сохранить пространство имен для всех последующих команд kubectl в этом контексте.

`kubectl config set-context --current --namespace=ggckad-s2`{{execute}}

`kubectl config view | grep "namespace:"`{{execute}}

установить контекст, используя имя пользователя и пространство имен.

`kubectl config set-context gce --user=cluster-admin --namespace=foo \
  && kubectl config use-context gce`{{execute}}

`kubectl config view | grep "namespace:"`{{execute}}

показать список контекстов

`kubectl config get-contexts`{{execute}}

показать текущий контекст (current-context)

`kubectl config current-context`{{execute}}

добавить новую конфигурацию для кластера в kubeconf с базовой аутентификацией

`kubectl config set-credentials kubeuser/foo.kubernetes.com --username=kubeuser --password=kubepassword`{{execute}}

удалить пользователя foo

`kubectl config unset users.foo `{{execute}}


## **Scale** Масштабруемся до 3 **instances**.

`kubectl scale deployment/random-logger --replicas=3`{{execute}}

**3 pods** подымутся в ближайшее время.

`kubectl get pods`{{execute}}

> Спасибо **Vicente Zepeda** за предоставление этого красивого простого контейнера. [Исходный код здесь](https://github.com/chentex/random-logger).
