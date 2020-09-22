
**Prometheus** - это решение для мониторинга с открытым исходным кодом, которое можно интегрировать с собственной статистикой **Envoy-я**.

Теперь давайте посмотрим на конфигурацию **prometheus**:

`prometheus.yml`{{open}}

Мы видим, что конфигурация **prometheus** использует **job** с именем **`envoy`**.

```
scrape_configs:
  - job_name: 'envoy'
    metrics_path: /stats/prometheus
```
Запустите **prometheus** командой:

```
docker run -d -p 9090:9090 \
    -v /root/envoy/prometheus.yml:/etc/prometheus/prometheus.yml \
    --name prometheus-server \
    prom/prometheus
```{{execute}}

Вы можете получить доступ к панели управления **Prometheus** по этой ссылке:

https://[[HOST_SUBDOMAIN]]-9090-[[KATACODA_HOST]].environments.katacoda.com/targets
