# Install kubectx/kubens.

git clone https://github.com/ahmetb/kubectx /opt/kubectx

kubectx помогает переключаться между кластерами вперед и назад:

![opa](./assets/kubens-demo.gif) 

**Kubernetes** запускается, это может занять несколько минут. Как только кластер готов,
выполните несколько команд с помощью **kubectl**:


- `kubectl cluster-info`{{execute}}
- `kubectl version`{{execute}}
- `kubectl get nodes`{{execute}}
- `kubectl get namespaces`{{execute}}
- `kubectl get pods --all-namespaces`{{execute}}

Нажмите продолжить, когда будете готовы двигаться дальше.