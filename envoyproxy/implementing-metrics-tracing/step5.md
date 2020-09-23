Теперь давайте запустим **grafana** с помощью этой команды:

`docker run --name=grafana -d -p 3000:3000 grafana/grafana`{{execute T1}}

И доступ к панели управления **dashboard** по этому URL:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/

И используйте эти учетные данные **credentials** по умолчанию:
`admin`{{copy}} \ `admin`{{copy}}

На первом этапе вас попросят сменить пароль, вы можете сделать это, если хотите, или можете пропустить этот шаг.

Первым шагом к созданию информационной панели **dashboard** является наличие источника данных **datasource**. 
Давайте определим источник данных с **phometheus data**, настроенными ранее:

URL-адрес **phometheus** должен быть:

`http://172.18.0.5:9090`{{copy}}

Для всех остальных полей **other fields** вы можете использовать значения по умолчанию **default values**

![](/envoyproxy/scenarios/implementing-metrics-tracing/assets/prometheus-data-source.png)

Протестируйте и сохраните свой источник данных **datasource**.

## Build a dashboard

Чтобы создать информационную панель **dashboard**, вы можете создать ее с нуля или использовать уже существующую, например:
https://grafana.com/dashboards/6693

Давайте использовать эту существующую панель управления **dashboard**. Скопируйте идентификатор и используйте опцию `Import`.

`6693`{{copy}}

Выберите **Prometheus**  в качестве источника данных и **Import**.

![](/envoyproxy/scenarios/implementing-metrics-tracing/assets/import.png)

[View Dashboard for the targetCluster](https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/d/000000003/envoy-proxy?refresh=5s&orgId=1&var-cluster=targetCluster&var-hosts=All)

## Change Traffic

`while true; do curl localhost; sleep .1; done`{{execute interrupt T2}}

Должен увидеть большой всплеск **big spike** трафика на панели инструментов **dashboard**.

## Generate Errors

`curl 172.18.0.3/unhealthy; curl 172.18.0.4/unhealthy;`{{execute}}

В **Prometheus** вы также увидите увеличение количества сообщений об ошибках **500 error messages**.

https://[[HOST_SUBDOMAIN]]-9090-[[KATACODA_HOST]].environments.katacoda.com/graph

`envoy_cluster_external_upstream_rq{envoy_cluster_name="targetCluster"}`{{copy}}
