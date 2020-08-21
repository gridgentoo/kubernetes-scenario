Скоро у вас появится **Kubeflow platform**, и вы сможете экспериментировать.  

`kubectl get services --namespace kubeflow`{{execute}}

Развертывания **starting up**.

`kubectl get deployment --namespace kubeflow`{{execute}}

Каждое развертывание становится доступным после того, как статус **`AVAILABLE`** изменится с **`0`** to **`1`**. Всем Подам, связанным с **Deployments** и **Services**, требуется несколько минут, чтобы загрузить свои контейнеры и стартовать. 

`kubectl get pods --namespace kubeflow`{{execute}}

This whole Kubeflow framework will be available once these Pods all report `Running`. On a production cluster or a higher performing development or test cluster this Kubeflow stack would take less time to start and would normally be already running.

Вся эта структура **Kubeflow framework** будет доступна после того, как все Поды сообщат **`Running`**. В **production cluster** или более производительном кластере разработки или тестирования этому **Kubeflow stack** потребуется меньше времени для запуска.

Есть несколько новых **Custom Resource Definitions (CRDs)**, которые были установлены от имени оператора **Kubeflow Operator**.

`kubectl get crds`{{execute}}

