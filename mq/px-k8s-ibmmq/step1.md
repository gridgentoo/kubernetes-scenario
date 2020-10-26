Для начала нам нужно дождаться готовности Kubernetes и Portworx. Наберитесь терпения, это не **very high performance environment**, это просто место, где можно чему-то научиться:

### Step: подождите, пока Kubernetes будет готов

Кликниет раздел ниже, который ожидает готовности всех узлов Kubernetes.
```
watch kubectl get nodes
```{{execute T1}}

Когда все **4 nodes** покажут статус **Running**, кликниете ```clear```{{execute interrupt}}, чтобы нажать ctrl-c и очистить экран.

### Step: : дождитесь, пока Portworx будет готов

Наблюдайте за модулями **Portworx** и ждите, пока они будут готовы на всех **nodes**. Это может занять несколько минут, так как для этого нужно загрузить несколько **docker images**. Вы будете видеть **'No resources found'**, пока не будут извлечены-**pulled** все **images**.

```
watch kubectl get pods -n kube-system -l name=portworx -o wide
```{{execute T1}}

Когда все Поды покажут **STATUS Running and READY 1/1**, кликните ```clear```{{execute interrupt}} , или ctrl-c, и что очистит экран.

Теперь, когда у нас есть кластер Portworx, приступим к следующему шагу!