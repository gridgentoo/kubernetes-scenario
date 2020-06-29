Каждый **Node** в кластере **Kubernetes** имеет процесс **Kubelet**. В каждом процессе **Kubelet** есть **cAdvisor**. **CAdvisor** непрерывно собирает метрики **metrics** о состоянии ресурсов **Kubernetes** на каждом **Node**. Эта метрическая информация **metrics**, крайне важна для мониторинга, чтобы понять состояние **state** кластера. Это богатство информации доступно через **Resource Metrics API**. 

Давайте проверим метрики **metrics**.

Каждый **node** предоставляет статистику, постоянно обновляемую **cAdvisor**. Для вашего кластера получите список node names.

`kubectl get nodes`{{execute}}

For this small Kubernetes cluster on Katacoda the two names are named _master_ and _node01_.
Для этого небольшого кластера **Kubernetes** на **Katacoda** есть два имени называются **master** и **node01**.

`export NODE=master`{{execute}}

Откройте прокси для **Kubernetes API port**.

`kubectl proxy &`{{execute}}

Получите доступ к статистике **worker node** с помощью этой команды в **Metrics API**.

`curl localhost:8001/api/v1/nodes/$NODE/proxy/stats/`{{execute}}

нажмите ```clear```{{execute interrupt}} 

`curl localhost:8001/api/v1/nodes/$(kubectl get nodes -o=jsonpath="{.items[0].metadata.name}")/proxy/metrics`{{execute}}

нажмите ```clear```{{execute interrupt}} 

**API Kubernetes** объединяет метрики всего кластера в `/ metrics`.

`curl localhost:8001/metrics`{{execute}}

нажмите ```clear```{{execute interrupt}} 
