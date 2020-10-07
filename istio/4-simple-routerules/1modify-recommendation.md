**IMPORTANT**: **Не пытайтесь редактировать файлы или выполнять какие-либо команды, пока курсор терминала не станет доступным**.

Вы можете поэкспериментировать с правилами маршрутизации **Istio routing rules**, внеся изменения в файл **RecommendedController.java**.

Откройте `/recommendation/java/vertx/src/main/java/com/redhat/developer/demos/recommendation/RecommendationVerticle.java`{{open}} в редакторе. Теперь сделайте следующую модификацию.

```java
    private static final String RESPONSE_STRING_FORMAT = "recommendation v2 from '%s': %d\n";
```    

**Note:** Файл сохраняется автоматически.

Теперь перейдите в **folder** с рекомендациями `cd ~/projects/istio-tutorial/recommendation/java/vertx`{{execute T1}}

Убедитесь, что файл изменился: `git diff`{{execute T1}}.

Чтобы выти из **diff** нажмите **q**

Скомпилируйте **project** с изменениями, которые вы сделали.

`mvn package`{{execute T1}}

#################################################

##  Create the recommendation:v2 docker image.

Теперь мы создадим новый образ **new image**, используя **`v2`**. Тег **`v2`** во время сборки докера **docker build** имеет большое значение.

Выполнить следующую команду:

 `docker build -t example/recommendation:v2 .`{{execute T1}}

 Вы можете проверить созданный **image**, набрав:

`docker images | grep recommendation`{{execute T1}}

## Create a second deployment with sidecar proxy

Также есть второй файл **deployment.yml** для правильной маркировки с помощью **label**

Выполнить следующую команду:

`oc apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment-v2.yml) -n tutorial`{{execute T1}}

Чтобы посмотреть созданые поды, выполните следующую команду:

`oc get pods -w`{{execute T1}}

Как только столбец READY в Поде рекомендаций станет 2/2, вы можете нажать **`CTRL+C`**

Протестируйте конечную точку **`customer`** endpoint:

`curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute interrupt T1}}

Скорее всего, вы увидите **"customer => preference => recommendation v2 from '2819441432-5v22s': 1"**, поскольку по умолчанию вы получаете **round-robin load-balancing** балансировку нагрузки, когда есть более одного Пода за Сервисом **Service**

Скорее всего, вы увидите **"customer => preference => recommendation v1 from '99634814-d2z2t': 3"**, где **'99634814-d2z2t'** - это Под, работающий под **v1**, а 3 - это, в основном, количество раз, когда вы попадаете в конечную точку **endpoint**.

Отправьте несколько запросов в **`Terminal 2`**, чтобы увидеть их ответы

`while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .5; done`{{execute T2}}

Поведение **Kubernetes/OpenShift** по умолчанию - это **round-robin load-balance** балансировка нагрузки для всех доступных Подов за **behind a single Service**. 
Добавьте еще одну реплику **recommendations-v2** Deployment.

`oc scale --replicas=2 deployment/recommendation-v2`{{execute T1}}

Подождите, пока второй Под **`recommendation:v2`** станет доступен, выполните `oc get pods -w`{{execute T1}}

Как только столбец READY в Поде рекомендаций станет 2/2, вы можете нажать **`CTRL+C`** 

Убедитесь, что следующая команда выполняется в `Terminal 2` `while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .5; done`{{execute interrupt T2}}

Вы увидите два запроса на **`v2`** для каждого из **`v1`**.

Вернитесь к **single replica** развертывания **`recommendation-v2`** deployment:

`oc scale --replicas=1 deployment/recommendation-v2`{{execute interrupt T1}}

В **`Terminal 2`** вы увидите, что запросы циклически сбалансированы **round-robin balance** между **`v1`** and **`v2`**.
