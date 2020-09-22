Вы можете увидеть **statistics generated**, созданную в тексте плана по этому URL:

https://[[HOST_SUBDOMAIN]]-9901-[[KATACODA_HOST]].environments.katacoda.com/stats/prometheus

И вы можете использовать одно конкретное поле для построения графика, например:
`envoy_cluster_external_upstream_rq`

![](/envoyproxy/scenarios/implementing-metrics-tracing/assets/envoy_cluster_external_upstream_rq.png)

Чтобы построить график, перейдите в панель управления **dashboard**:
https://[[HOST_SUBDOMAIN]]-9090-[[KATACODA_HOST]].environments.katacoda.com/graph

И используйте этот запрос **query**:
```envoy_cluster_external_upstream_rq{envoy_cluster_name="targetCluster"}```{{copy}}
