
После установки **additional configuration** дополнительной конфигурации **Envoy** может быть запущен.

В этом случае прокси-сервер буде доступен как для порта **80** для **HTTP-трафика**, так и для порта 443 для **HTTPS**. 
Он также предоставляет панель администратора на **8001**, позволяющую просматривать информацию Дашборда о сертификатах.

### Старт **Envoy**

`docker run -it --name proxy1 -p 80:8080 -p 443:8443 -p 8001:8001 -v /root/:/etc/envoy/ envoyproxy/envoy`{{execute T2}}

Все завершение **HTTPS** и **TLS** обрабатывается через **Envoy Proxy**, что означает, что приложение не нужно изменять. 
Чтобы запустить серию **HTTP servers** для обработки входящих запросов, выполните следующую команду:

`docker run -d katacoda/docker-http-server; docker run -d katacoda/docker-http-server;`{{execute T1}}

### Тестирование Конфигурации

После запуска **Proxy** можно проверить конфигурацию.

Во-первых, если вы отправляете **HTTP request**, прокси должен вернуть ответ перенаправления на версию **HTTPS** из-за вашего флага конфигурации.

`curl -H "Host: example.com" http://localhost -i`{{execute T1}}

Вы могли увидеть **response**, указывающий на сконфигурированный вами **redirect**.

```
HTTP/1.1 301 Moved Permanently
location: https://example.com/
```

Запросы **HTTPS requests** будут обрабатываться в соответствии с вашей конфигурацией. Попробуйте выполнить следующие запросы:

`curl -k -H "Host: example.com" https://localhost/service/1 -i`{{execute T1}}

`curl -k -H "Host: example.com" https://localhost/service/2 -i`{{execute T1}}

Обратите внимание, что без аргумента  **`-k`** cURL ответит ошибкой из-за самоподписанного сертификата **self-signed certificate**:

`curl -H "Host: example.com" https://localhost/service/2 -i`{{execute T1}}

## Верификация Сертификатов

Используя **OpenSSL CLI**, можно просмотреть сертификат, возвращенный сервером. 
Это позволит нам убедиться, что **Envoy** возвращает правильный сертификат:

`echo | openssl s_client -showcerts -servername example.com -connect localhost:443 2>/dev/null | openssl x509 -inform pem -noout -text`{{execute T1}}

### Дашборд

Дашборд отображается информация об определенных сертификатах и их возрасте. Более подробную информацию можно найти на сайте https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com/certs
