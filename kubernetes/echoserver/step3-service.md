Контейнер **echoserver** работает в модуле **Pod**. Каждому **Pod** в **Kubernetes** назначен внутренний и виртуальный **IP**-адрес в **10.xx.xx.xx**. Даже внутри кластера другие приложения обычно не должны пытаться обращаться к этим IP-адресам **Pods**. Вместо этого каждому реплицированному **Pod** предоставляется **single service**.

На **service** можно ссылаться по ее метке **label**, и, следовательно, доступ осуществляется с помощью  **Domain Name System (DNS)** , которая разрешает - **resolve** URL-адрес **service** на основе метки **label**. **Service** добавит слой **layer of indirection**, где он будет знать, как подключиться к **Pod**. Все остальные приложения в кластере будут подключаться к службе через поиск **DNS lookups**, а **services** будут подключаться к конкретным **Pods**.

**Expose the Pod**, обратив его к **Service** с пометкой **label** >> **hello**.

`kubectl expose deployment hello --type=NodePort`{{execute}}

`kubectl get service hello`{{execute}}

**NodePort** назначает значение порта на некотором свободном порте выше **30000**. Для этого примера **Katacoda** нам нужно, чтобы оно имело определенное значение, здесь мы выбираем **31001**. Используйте команду **patch**, чтобы изменить **service NodePort**  _hello_ от его случайного значения до выбранного.

`kubectl patch service hello --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

Сервис **NodePort** теперь настроен.

`kubectl get service hello`{{execute}}

`kubectl describe service hello`{{execute}}

Из-за виртуализации **Katacoda** вы не можете обратиться к этой службе **service** через браузер, но вы можете использовать домен **Katacoda** в качестве URL-адреса той же службы **service**. Обратите внимание на тот же номер порта, размещенный в поддомене **URL**.

`curl -s https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}
