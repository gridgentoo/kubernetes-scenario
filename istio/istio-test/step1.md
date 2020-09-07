На этом обязательном подготовительном шаге вам необходимо развернуть инфраструктуру для прохождения упражнения

* учебный кластер Kubernetes
* Istio Service Mesh.

Выполните, пожалуйста, все необходимые шаги описанные ниже в этом шаге упражнения.

## Kubernetes

Дождитесь подтверждения запуска кластера в терминале, должно появиться такое сообщение

```
master $ launch.sh
Waiting for Kubernetes to start...
Kubernetes started
```

Убедитесь, что все поды находятстя в состоянии Running прежде чем двигаться дальше `kubectl get pods --all-namespaces`{{execute T1}}

Исключение может быть сделано для katacoda-cloud-provider он может остаться в статусе CrashLoopBackOff, что никак не влияет на дальнейшие шаги

## Istio

Запустите установку istio `/usr/local/bin/istio-install.sh`{{execute T1}}

Примечание: если вас как-то смущает `error: taint "node-role.kubernetes.io/master" not found`, проигнорируйте это сообщение пожалуйста, оно ни на что не влияет.

Проверьте, что все поды Istio в состоянии Running `kubectl get pods -n istio-system`{{execute T1}}

## TroubleShoot

Если что-то пошло не так:

* перезагрузите страницу упражнения и начните сценарий заново.
