С определенным  **TLS Context** сайт сможет обслуживать трафик через **HTTPS**. Если пользователь попадает на **HTTP**-версию сайта, мы хотим, чтобы он перенаправлял его на **HTTPS** версию, чтобы обеспечить безопасность.

## Edit HTTP Filter

В нашей конфигурации **HTTP**, как часть соответствия фильтра для домена, в конфигурацию **фильтра** необходимо добавить флаг  ***`https_redirect: true`*** .

Наша стандартная конфигурация **Envoy Proxy** выглядит так, как показано ниже.

<pre class="file">
route_config:
  virtual_hosts:
  - name: backend
  domains:
  - "example.com"
  routes:
  - match:
      prefix: "/"
</pre>

Его необходимо расширить, чтобы включить поле **HTTPS Redirect**.

<pre class="file" data-filename="envoy.yaml" data-target="insert" data-marker="#TODO:HTTP-Redirect">
redirect:
                  path_redirect: "/"
                  https_redirect: true
</pre>

Когда пользователь посещает HTTP-версию сайта, **Envoy Proxy** сопоставляет домен и путь на основе **filter configuration**. 
Это приводит к перенаправлению пользователя на **HTTPS* версию сайта.

Это можно увидеть в завершенном примере по адресу `envoy-completed.yaml`{{open}}.
