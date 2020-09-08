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

![istio version](./assets/istio.png)

Запустите установку istio `/usr/local/bin/istio-install.sh`{{execute T1}}

Примечание: если вас как-то смущает `error: taint "node-role.kubernetes.io/master" not found`, проигнорируйте это сообщение пожалуйста, оно ни на что не влияет.

Проверьте, что все поды Istio в состоянии Running `kubectl get pods -n istio-system`{{execute T1}}

### Проверьте, что установлено
https://istio.io/latest/docs/setup/install/istioctl/

Команда **istioctl** сохраняет **IstioOperator CR**, который использовался для установки Istio, в копию CR с именем **installed-state**. Вместо проверки развертываний, модулей, служб и других ресурсов, установленных **Istio**, например:

`kubectl -n istio-system get deploy`{{execute T1}}

Вы можете проверить **installed-state CR**, чтобы увидеть, что установлено в кластере, а также все пользовательские настройки. Например, выгрузите содержимое **installed-state** в файл YAML, используя следующую команду:

`kubectl -n istio-system get IstioOperator installed-state -o yaml > installed-state.yaml`{{execute T1}}

The installed-state CR is also used to perform checks in some istioctl commands and should therefore not be removed.
