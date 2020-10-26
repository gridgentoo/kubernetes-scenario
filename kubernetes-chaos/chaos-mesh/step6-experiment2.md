В этом следующем эксперименте исследуйте, как **Chaos Mesh** выполняет обычный эксперимент периодического и случайного удаления Подов.

## Установим пример приложения Nginx


Установите пример приложения в качестве цели для эксперимента. 
Это просто развертывание обычного веб-сервера **Nginx** с репликациями Подов. 
Примените развертывание к пространству имен **_chaos-sandbox_**:

`kubectl create namespace chaos-sandbox`{{execute}}

`kubectl apply -f nginx.yaml -n chaos-sandbox`{{execute}}

Для запуска всех Подов потребуется некоторое время. 
Вы можете увидеть статус приложения в пространстве имен по умолчанию **default namespace**:

`kubectl get -n chaos-sandbox deployments,pods,services`{{execute}}

## Define - определить эксперимент

В **Chaos Mesh** установим несколько пользовательских ресурсов **custom resources**:

`kubectl get crds`{{execute}}

Для этого эксперимента создайте декларативный **YAML**-манифест, который определяет эксперимент вокруг **`podchaos.chaos-mesh.org`**. 
Спецификация эксперимента для манифеста **_PodChaos_** выглядит следующим образом:

`ccat pod-removal-experiment.yaml`{{execute}}

Эксперимент заявляет, что конкретный Под должен уничтожаться каждые **15s**. 
Удаление будет применено только к целевому Поду с пометкой **"chaos"**: **"blast here"**, который равен **_blast radius_**:

`kubectl get -n chaos-sandbox deployments,pods,services -l chaos=blast-here`{{execute}}

## Apply Experiment

Поскольку **Chaos Mesh** следует паттерну **Kubernetes Operator** с **CRD**, эксперимент может быть применен как любой другой объект **Kubernetes**.

`kubectl apply -f pod-removal-experiment.yaml`{{execute}}

Сейчас идет эксперимент.

`kubectl get PodChaos -n chaos-mesh`{{execute}}

## Observe

Основываясь на **cron time** в эксперименте, наблюдайте, как поды случайным образом завершаются, и запускаются новые Поды:

`watch kubectl get -n chaos-sandbox deployments,pods,services`{{execute}}

Используйте этот `clear`{{execute interrupt}}, чтобы прервать наблюдение **watch**, или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Посмотрите на панель инструментов **Chaos Mesh dashboard**, найдите эксперимент и разверните его, чтобы изучить детали эксперимента.

Есть еще много видов экспериментов. Какие из них могут помочь вашему приложению повысить его доступность во времена хаоса **times of chaos**?
