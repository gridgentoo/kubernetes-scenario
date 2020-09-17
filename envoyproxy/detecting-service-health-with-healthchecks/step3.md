
С новой проверкой работоспособности **health check**, **Envoy** проверит работоспособность каждого ноды, определенных в кластере.

## Task

Запустите **Envoy** командой:

`docker run -d --name proxy1 -p 80:8080 -v /root/:/etc/envoy envoyproxy/envoy`{{execute T1}}

Запустите две ноды, оба запускаются в работоспособном состоянии **healthy state**.

`docker run -d katacoda/docker-http-server:healthy; docker run -d katacoda/docker-http-server:healthy;`{{execute T1}}

## Testing

При отправке запросов в **Envoy** исправные запросы **healthy requests** должны возвращаться с серверов HTTP.

`curl localhost -i`{{execute T1}}
