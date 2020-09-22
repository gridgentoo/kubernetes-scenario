[Envoy](https://www.envoyproxy.io/) легко интегрируется с проектами с открытым исходным кодом, чтобы иметь метрики и распределенную трассировку **distributed tracing**.

В следующем сценарии показано, как:

- **Expose Envoy's** статистику в [Prometheus](https://prometheus.io/).  

- Используйте источник данных **prometheus datasource** для создания информационных панелей **dashboards** в [Grafana](https://grafana.com/).

- Сконфигурируйте **envoy** на отправку **traces** в [Jaeger](https://www.jaegertracing.io/).

