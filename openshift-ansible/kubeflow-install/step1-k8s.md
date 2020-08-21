<img align="right" src="./assets/k8s-logo.png" width="100">

Для этого сценария **Katacoda** только что запустила для вас новый кластер **Kubernetes**. Убедитесь, что он готов к использованию.

`kubectl version --short && \
kubectl get componentstatus && \
kubectl get nodes && \
kubectl cluster-info`{{execute}}

Также доступен менеджер пакетов [Helm](https://helm.sh/), используемый для установки приложений в **Kubernetes**.

`helm version --short`{{execute}}

<img align="right" src="./assets/k8s-dash.png" width="200">

## Kubernetes Dashboard ##

Вы можете администрировать свой кластер с помощью инструмента командной строки **`kubectl` CLI tool**  или использовать визуальную панель **Kubernetes Dashboard**. Используйте этот скрипт для доступа к защищенной панели инструментов **protected Dashboard**.

`token.sh`{{execute}}
