В проекте есть скрипт, который установит **Chaos Mesh operator**. Однако, чтобы не изобретать колесо, мы предпочитаем **Helm chart** для проектов, поскольку она предлагает часто используемое **package management** с параметрами, обновлениями и удалением.

Создайте **namespace** для оператора **Chaos Mesh operator**:

`kubectl create namespace chaos-mesh`{{execute}}

Добавьте **chart repository** для установки **Helm chart**:

`helm repo add chaos-mesh https://charts.chaos-mesh.org`{{execute}}

Добавьте **Custom Resource definitions**, которые позволяют управлять хаосом с помощью **declarations**:

`curl -sSL https://mirrors.chaos-mesh.org/v0.9.0/crd.yaml | kubectl apply -f -`{{execute}}

Инсталлируйте chart:

```bash
helm install chaos-mesh chaos-mesh/chaos-mesh \
  --version 0.2.0 \
  --namespace chaos-mesh \
  --set dashboard.create=true
```{{execute}}

Убедитесь, что оператор **Chaos Mesh operator** запустил свою плоскость управления **control plane**:

`kubectl get deployments,pods,services --namespace chaos-mesh`{{execute}}

В оптимальном случае все должно быть в статусе **running** примерно за ~20 секунд.

Компоненты плоскости управления **control plane** для **Chaos Mesh**:

- controller-manager - используется для планирования и управления жизненным циклом **lifecycle** экспериментов с хаосом **chaos experiments**..
- chaos-daemon - это Поды, которые управляют сеткой хаоса **chaos mesh**. Pods работают на каждом узле кластера и завернуты в **DaemonSet**. Эти DaemonSets имеют привилегированные системные разрешения для доступа к сети каждого **Node's network**, **cgroups**, **chroot** и другим ресурсам, к которым осуществляется доступ на основе ваших экспериментов.
- chaos-dashboard - дополнительный веб-интерфейс, предоставляющий вам альтернативные средства для администрирования **chaos engine** и экспериментов. Он используется для удобства, и любое производственное использование движка должно осуществляться через ресурсы **YAML** для **Chaos Mesh CRDs**.

