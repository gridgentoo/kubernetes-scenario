**IMPORTANT**: *Не пытайтесь редактировать файлы или выполнять какие-либо команды, пока курсор терминала не станет доступным.*

Мы можем поэкспериментировать с правилами маршрутизации **Istio routing rules**, внеся изменения в файл **RecommendedController.java**.


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

## Создайте рекомендацию **recommendation**:v2 docker image.

We will now create a new image using `v2`. The `v2`tag during the docker build is significant.

Execute `docker build -t example/recommendation:v2 .`{{execute T1}}

You can check the image that was create by typing `docker images | grep recommendation`{{execute T1}}

## Create a second deployment with sidecar proxy

There is also a 2nd deployment.yml file to label things correctly

Execute: `oc apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment-v2.yml) -n tutorial`{{execute T1}}

To watch the creation of the pods, execute `oc get pods -w`{{execute T1}}

Once that the recommendation pod READY column is 2/2, you can hit `CTRL+C`. 

Test the `customer` endpoint: `curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute interrupt T1}}

You likely see "customer => preference => recommendation v2 from '2819441432-5v22s': 1" as by default you get round-robin load-balancing when there is more than one Pod behind a Service.

You likely see "customer => preference => recommendation v1 from '99634814-d2z2t': 3", where '99634814-d2z2t' is the pod running v1 and the 3 is basically the number of times you hit the endpoint.

Send several requests on `Terminal 2` to see their responses

`while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .5; done`{{execute T2}}

The default Kubernetes/OpenShift behavior is to round-robin load-balance across all available pods behind a single Service. Add another replica of recommendations-v2 Deployment.

`oc scale --replicas=2 deployment/recommendation-v2`{{execute T1}}

Wait the second `recommendation:v2` pod to become available, execute `oc get pods -w`{{execute T1}}

Once that the recommendation pod READY column is 2/2, you can hit `CTRL+C`. 

Make sure that the following command is running on `Terminal 2` `while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .5; done`{{execute interrupt T2}}

You will see two requests for `v2` for each one of `v1`.

Scale back to a single replica of the `recommendation-v2` deployment:

`oc scale --replicas=1 deployment/recommendation-v2`{{execute interrupt T1}}

On `Terminal 2`, you will see requests being round-robin balanced between `v1` and `v2`.
