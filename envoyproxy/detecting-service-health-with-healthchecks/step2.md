**Health check** добавляется в конфигурацию кластера в **Envoy configuration**. Следующая конфигурация будет использовать конечную точку **`/health` endpoint** в каждом из определенных узлов, чтобы определить, исправна **healthy** она или нет, на основе возвращенного состояния **HTTP Status returned**.

<pre class="file" data-filename="envoy.yaml" data-target="append">
    health_checks:
      - timeout: 1s
        interval: 10s
        interval_jitter: 1s
        unhealthy_threshold: 6
        healthy_threshold: 1
        http_health_check:
          path: "/health"
</pre>

Ключевые поля:

*  **interval**: как часто следует выполнять проверку работоспособности **health check**

* **unhealthy_threshold**: количество **healthy health** нездоровых проверок работоспособности, необходимых для того, чтобы хост был помечен как нездоровый **unhealthy**.

* **healthy_threshold**: количество проверок работоспособности **health checks**, необходимых для того, чтобы узел был отмечен как работоспособный **marked healthy**.

* **http_health_check.path**: указывает путь **HTTP path**, который будет запрошен во время проверки работоспособности **health checking**.

Более подробную информацию об **API** можно найти по адресу [with the documentation](https://www.envoyproxy.io/docs/envoy/latest/api-v2/api/v2/core/health_check.proto).

### core.HealthCheck

```
{
  "timeout": "{...}",
  "interval": "{...}",
  "initial_jitter": "{...}",
  "interval_jitter": "{...}",
  "interval_jitter_percent": "...",
  "unhealthy_threshold": "{...}",
  "healthy_threshold": "{...}",
  "reuse_connection": "{...}",
  "http_health_check": "{...}",
  "tcp_health_check": "{...}",
  "grpc_health_check": "{...}",
  "custom_health_check": "{...}",
  "no_traffic_interval": "{...}",
  "unhealthy_interval": "{...}",
  "unhealthy_edge_interval": "{...}",
  "healthy_edge_interval": "{...}",
  "event_log_path": "...",
  "always_log_health_check_failures": "...",
  "tls_options": "{...}"
}
```
