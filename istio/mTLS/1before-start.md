Вам необходимо удалить **customer route**, созданный в начале руководства.

Для этого просто запустите: `oc delete route customer`{{execute T1}}

Затем вам нужно включить **Istio Ingress** для приема всего трафика и перенаправления его в службу **customer service**. 
По этой причине давайте создадим **Gateway** и **VirtualService**, которые позволяют локальным вызовам достигать **clustered service** внутри **mesh**.

`istioctl create -f ~/projects/istio-tutorial/istiofiles/gateway-customer.yml`{{execute T1}}

Затем настройте некоторые переменные среды, которые помогут вам при тестировании:

`export INGRESS_PORT=$(oc -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}'); \
export GATEWAY_URL=http://customer-tutorial.[[HOST_SUBDOMAIN]]-$INGRESS_PORT-[[KATACODA_HOST]].environments.katacoda.com; `{{execute T1}}

Теперь вы можете запустить **curl**, но с **GATEWAY_URL**, и вы увидите те же сообщения, что и раньше (`customer => preference => recommendation v1 from 'b87789c58-mfrhr': 1`):

`curl ${GATEWAY_URL}`{{execute T1}}

**Примечание:** Приведенная ниже команда может вернуть `customer => 503 preference => 503 no healthy upstream`. В этом случае, **repeat the command** `curl ${GATEWAY_URL}`{{execute T1}} until you see `customer => preference => recommendation v1 from 'b87789c58-mfrhr': 1`


