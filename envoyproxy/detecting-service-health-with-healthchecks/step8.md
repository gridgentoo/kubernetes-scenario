При наличии функции обнаружения выбросов **Outlier Detection**, **Envoy** удалит хост на основе ответов на **real requests**.

## Testing

Запустите две ноды, оба запускаются в **healthy state**.
`docker run -d katacoda/docker-http-server:healthy; docker run -d katacoda/docker-http-server:healthy;`{{execute T1}}

Запустите **Envoy** командой:

```
docker run -d --name proxy2 -p 81:8080 \
    -v /root/:/etc/envoy \
    -v /root/envoy1.yaml:/etc/envoy/envoy.yaml \
    envoyproxy/envoy
```{{execute T1}}

В отдельном окне терминала запустите цикл, который будет отправлять запросы **send requests**. Это позволит вам определить изменения статуса.

`while true; do curl localhost:81; sleep .5; done`{{execute T3}}

## **Mark Node Unhealthy** - отметить ноду как нездоровый

Чтобы сделать узел неработоспособным **unhealthy**, вызовите конечную точку `curl 172.18.0.5/unhealthy`{{execute T1}}

Это приведет к тому, что все будущие **requests** будут возвращать сообщение об ошибке 500 `curl 172.18.0.5 -i`{{execute T1}}.

В это время, после **3rd request** с кодом `5xx`, **Envoy** **eject** Ноду. Вы можете увидеть это поведение во втором терминале.

## **Mark Node Healthy** - отметить ноду как работоспособный

Вы можете снова отметить узел как работоспособный **healthy**  и посмотреть, как **Envoy** снова будет отправлять трафик на этот узел.  

`curl 172.18.0.5/healthy`{{execute T1}}.

