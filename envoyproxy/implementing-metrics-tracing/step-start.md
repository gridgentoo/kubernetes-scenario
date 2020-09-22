Первоначальный файл конфигурации **envoy** был создан в
`envoy.yaml`{{open}}

В этом файле определено, что сервер будет работать со **listener**, используя все сетевые интерфейсы на порту **10000**.

```
- name: listener_0
  address:
    socket_address: { address: 0.0.0.0, port_value: 10000 }
```

Также эта конфигурация определяет два узла в **`targetCluster`**

```
hosts: [
  { socket_address: { address: 172.18.0.3, port_value: 80 }},
  { socket_address: { address: 172.18.0.4, port_value: 80 }}
]```

Запустите **envoy proxy** с определенной конфигурацией, используя эту команду:

```
docker run --name=proxy -d \
  -p 80:10000 \
  -p 9901:9901 \
  -v $(pwd)/envoy/:/etc/envoy \
  envoyproxy/envoy:latest
```{{execute}}

А затем запустите два **healthy http servers** с помощью этой команды:
```
docker run -d katacoda/docker-http-server:healthy;
docker run -d katacoda/docker-http-server:healthy;
```{{execute}}

Проверьте, работают ли Ноды с помощью этой команды:

```curl 172.18.0.3:80; curl 172.18.0.4:80```{{execute}}

Вы должны получить ответ, похожий на

```
<h1>A healthy request was processed by host: dfe3613cc3da</h1>
<h1>A healthy request was processed by host: 6db2061eb74a</h1>
```

И вы можете запросить **request** через **envoy**

```curl localhost:80```{{execute}}

**Envoy** отвечает на **request** и балансирует между двумя узлами с помощью стратегии **`ROUND_ROBIN`** в соответствии с нашей конфигурацией.

Кроме того, вы можете проверить это через локальный браузер с URL-адресом https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/
