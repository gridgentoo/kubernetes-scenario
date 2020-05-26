### Разверните Elastic Beats

`kubectl create -f /root/course/filebeat-kubernetes.yaml `{{execute HOST1}}

`kubectl create -f /root/course/metricbeat-setup.yaml`{{execute HOST1}}

### Kibana обзор

Пока изображения для Filebeat и Metricbeat загружаются, давайте посмотрим на Kibana

### Продолжить развертывание Beats

`kubectl create -f /root/course/metricbeat-kubernetes.yaml `{{execute HOST1}}

`kubectl create -f /root/course/packetbeat-kubernetes.yaml `{{execute HOST1}}

`kubectl get pods -n kube-system | grep beat`{{execute HOST1}}

