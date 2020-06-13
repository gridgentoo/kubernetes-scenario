<img align="right" src="./assets/k8s-logo.png" width="100">

Для этого сценария **Katacoda** только что запустила новый кластер **Kubernetes** для вас. Убедитесь, что он готов к использованию.

`kubectl version --short && \
kubectl get componentstatus && \
kubectl get nodes && \
kubectl cluster-info`{{execute}}

Также доступен менеджер пакетов [Helm](https://helm.sh/), используемый для установки приложений в **Kubernetes**.

`helm version --short`{{execute}}

<img align="right" src="./assets/k8s-dash.png" width="200">

## Kubernetes Dashboard ##

Вы можете администрировать свой кластер с помощью инструмента CLI `kubectl` или использовать визуальную панель управления **Kubernetes Dashboard**. Используйте этот скрипт для доступа к защищенной панели инструментов **Dashboard**.

`token.sh`{{execute}}

## Делой приложения ##

`helm repo list`{{execute}}

Поиск чарта **kube-ops**

`helm search hub kube-ops`{{execute}}

У каждого чарта есть **values**

`helm show values stable/kube-ops-view`{{execute}}

отправил вывод **stdout** от **helm show** в **values.yaml**

`helm show values stable/kube-ops-view > values.yaml`{{execute}}

`helm install ops-view stable/kube-ops-view --namespace=kube-system -f values.yaml`{{execute}}

Для запуска контейнеров **kube-ops-view** требуется несколько минут. Чтобы получить полный статус **provisioning** этой последовательности, выполните эту проверку.

`watch kubectl get deployments,pods,services --namespace kube-system`{{execute}}



