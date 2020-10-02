Для мониторинга **Istio** предлагает готовый мониторинг из коробки через **Prometheus** и **Grafana**.

**Note:** Прежде чем мы взглянем на **Grafana**, нам нужно отправить несколько запросов нашему приложению, используя **`Terminal 2`**: 

`while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .2; done`{{execute T2}}

Проверьте есть ли **`grafana`** route, набрав:

`oc get route -n istio-system`{{execute interrupt T1}}

Проверьте версию **istio**, набрав:

`istioctl version`{{execute interrupt T1}}

Теперь, когда вы знаете URL-адрес **`Grafana`**, откройте его по адресу 

http://grafana-istio-system.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/d/1/istio-dashboard?refresh=5s&orgId=1

![](../../assets/servicemesh/monitoring/grafana1.png)

Вы также можете проверить загруженность **services** 

http://grafana-istio-system.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/d/UbsSZTDik/istio-workload-dashboard?refresh=5s&orgId=1

![](../../assets/servicemesh/monitoring/grafana2.png)
