**Kubernetes** запускается, это может занять несколько минут.
Как только кластер будет готов, выполните несколько команд с помощью **kubectl**:

- `kubectl cluster-info`{{execute}}
- `kubectl version --short`{{execute}}
- `kubectl get nodes`{{execute}}
- `kubectl get namespaces`{{execute}}
- `kubectl get pods --all-namespaces`{{execute}}
