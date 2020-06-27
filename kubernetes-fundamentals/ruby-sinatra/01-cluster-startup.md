## Install kubectx/kubens.

git clone https://github.com/ahmetb/kubectx /opt/kubectx

kubectx помогает переключаться между кластерами вперед и назад:

![opa](./assets/kubens-demo.gif) 

**Kubernetes** запускается, это может занять несколько минут. Как только кластер готов,
выполните несколько команд с помощью **kubectl**:

нажмите ```clear```{{execute interrupt}} 

- `kubectl cluster-info`{{execute}}

нажмите ```clear```{{execute interrupt}} 

- `kubectl version`{{execute}}

нажмите ```clear```{{execute interrupt}} 

- `kubectl get nodes`{{execute}}

нажмите ```clear```{{execute interrupt}} 

- `kubectl get namespaces`{{execute}}

нажмите ```clear```{{execute interrupt}} 

- `kubectl get pods --all-namespaces`{{execute}}

Нажмите продолжить, когда будете готовы двигаться дальше.