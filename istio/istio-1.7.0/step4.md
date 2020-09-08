Пометьте пространство имен **`default`** с помощью **`istio-injection = enabled`** и установите пространство имен для автоматического внедрения сопроводительного файла **Sidecar**:

`kubectl label namespace default istio-injection=enabled`{{execute}}

### Разверните приложение

`kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml`{{execute}}

Подтвердите, что все службы и модули были запущены нормально, проявите терпение:：

`kubectl get services`{{execute}}

`kubectl get pods`{{execute}}

### Убедитесь, что Bookinfo работает правильно:：

`kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"`{{execute}}

### Развернуть Ingress

Определите шлюз Ingress:：

`kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

Подтвердите, что шлюз успешно создан:：

`kubectl get gateway`{{execute}}

Установите входящий **ingress IP**：

`export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')`{{execute}}

Установите входной порт: ingress：

`export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')`{{execute}}

Установите **`GATEWAY_URL`**:

`export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT`{{execute}}


### Подтвердите доступ

Вы можете использовать команду **curl**, чтобы подтвердить, можно ли получить доступ к приложению **Bookinfo** извне кластера:

`curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"`{{execute}}

Вы можете щелкнуть ссылку ниже, чтобы просмотреть:：

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/productpage

### Удалить istio

Программа удаления удалит разрешения **`RBAC`** пространство имен **`istio-system`** и все связанные ресурсы. 
Вы можете игнорировать ошибки тех ресурсов, которые не существуют, потому что они могли быть удалены.

`istioctl manifest generate --set profile=demo | kubectl delete -f -`{{execute}}