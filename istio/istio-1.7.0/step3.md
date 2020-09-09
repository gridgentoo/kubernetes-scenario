
Используйте конфигурацию **`demo`** для быстрой установки набора **istio**.

### Установить демонстрационный пример

Install a different profile
Other Istio configuration profiles can be installed in a cluster by passing the profile name on the command line. For example, the following command can be used to install the demo profile:

https://istio.io/v1.5/docs/setup/install/istioctl/

Используйте **`demo`** для настройки и установки **istio**:

`istioctl manifest apply --set profile=demo`{{execute}}


### Check what’s installed

`kubectl -n istio-system get deploy`{{execute}}

`kubectl -n istio-system get IstioOperator installed-state -o yaml > installed-state.yaml`{{execute}}

Проверьте, правильно ли развернута служба **Kubernetes**, и проверьте, есть ли у других служб, кроме службы **`jaeger-agent`**, правильный IP-адрес **`CLUSTER-IP`**.


**Примечание**: Здесь вы должны соблюдать **`EXTERNAL-IP`** для` istio-ingressgateway`. Если это **`<pending>`**, среда не может нормально обеспечить внешнюю балансировку нагрузки, и входной шлюз не может использоваться. В этом случае вы можете немного подождать. Если по прошествии некоторого времени он все еще находится в состоянии **`<pending>`**, рекомендуется обновить страницу и перезапустить курс для установки **istio**:

`kubectl get svc -n istio-system`{{execute}}

Убедитесь, что соответствующий **pod** успешно развернут и **`STATUS`** имеет значение **`Running`**:

`kubectl get pods -n istio-system`{{execute}}

Если все развернуто нормально, вы можете развернуть свои собственные службы.

### Следующие шаги

После успешного развертывания вы можете ввести пример **Bookinfo**, но я не буду описывать здесь маршрутизацию трафика, внедрение ошибок, ограничение скорости и другие функции **Istio**. Соответствующий контент будет представлен в разделе **Bookinfo**, и здесь будет сделано только краткое введение.

