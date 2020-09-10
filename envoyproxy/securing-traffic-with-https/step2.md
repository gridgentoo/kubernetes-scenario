To secure HTTP traffic the addition of a ***`tls_context`*** is required as a filter. The TLS context provides the ability to specify a collection of certificates for the domains configured within Envoy Proxy. When an HTTPS request is being processed, the matching certificate will be used.

In this case, the certificates are our self-signed generated in the first step.

Для защиты HTTP-трафика необходимо добавить ***`tls_context`*** в качестве фильтра. **TLS context** предоставляет возможность указать набор сконфигурированных с **Envoy Proxy**. При обработке запроса **HTTPS** будет использоваться соответствующий сертификат.

В этом случае сертификаты являются самоподписанными **self-signed generated**, созданными на первом шаге.

## Добавить **TLS Context** в прослушиватель **HTTPS Listener**

Откройте файл конфигурации `envoy.yaml`{{open}}. 
Он содержит схему необходимой поддержки **HTTPS**. 
Он имеет два настроенных прослушивателя **listeners**: один на порт **8080 для HTTP-трафика**, а другой на порт **8443 для HTTPS-трафика**.

Для прослушивателя **HTTPS listener** определен диспетчер подключений **HTTP Connection Manager**, который будет проксировать входящие запросы для конечных точек **`/service/1`** and **`/service/2`** endpoints. 
Это должно быть расширено, чтобы включить требуемый  ***`tls_context`***, как показано ниже.

<pre class="file" data-filename="envoy.yaml" data-target="insert" data-marker="#TODO:TLS-Context">
tls_context:
        common_tls_context:
          tls_certificates:
            - certificate_chain:
                filename: "/etc/envoy/certs/example-com.crt"
              private_key:
                filename: "/etc/envoy/certs/example-com.key"
</pre>

В контексте определяются **certificate and key generated**. 
Если бы у нас было несколько доменов, каждый со своим собственным сертификатом, тогда было бы определено несколько цепочек сертификатов.

Завершенную конфигурацию можно просмотреть на сайте `envoy-completed.yaml`{{open}}.
