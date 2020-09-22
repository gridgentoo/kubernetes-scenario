Распределенная трассировка **Distributed tracing** позволяет разработчикам получать визуализации потоков вызовов **visualizations of call flows** в больших сервис-ориентированных архитектурах. Это может быть бесценным для понимания сериализации, параллелизма и источников задержки **latency**. В этом примере мы будем использовать **Jaeger**, сквозную распределенную трассировку **end-to-end distributed tracing** с открытым исходным кодом.

Мы можем увидеть конфигурацию трассировки в `envoy.yaml`{{open}}

<pre class="file">
tracing:
  http:
    name: envoy.zipkin
    config:
      collector_cluster: 172.18.0.6
      collector_endpoint: "/api/v1/spans"
      shared_span_context: false
</pre>


Убедитесь, что **Jaeger** настроен на прием запросов **Zipkin** через переменную среды  **COLLECTOR_ZIPKIN_HTTP_PORT**.

Одна из важных конфигураций для нашего примера - это сообщение **connection manager**, который генерирует
 `x-request-id` **header** заголовок, если он не открыт.

 <pre class="file">
 generate_request_id: true
 tracing:
   operation_name: egress
 </pre>

`docker run -d --name jaeger -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 -p 9411:9411 -p 5775:5775/udp -p 16686:16686 jaegertracing/all-in-one:latest`{{execute}}
