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

Вы можете администрировать свой кластер с помощью инструмента CLI **kubectl** или использовать визуальную панель управления **Kubernetes Dashboard**. Используйте этот скрипт для доступа к защищенной панели инструментов.

`token.sh`{{execute}}


