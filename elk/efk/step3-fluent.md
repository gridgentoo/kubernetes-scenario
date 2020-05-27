Создайте конфигурацию для Fluent Bit.

Создайте пространство имен для цели установки.

`kubectl create namespace logs`{{execute}}

Установите Fluent Bit и передайте конечную точку endpoint, службы ElasticSearch в качестве параметра chart parameter. Этот chart установит DaemonSet, который запустит модуль Fluent Bit pod на каждом Ноде. При этом каждая служба Fluent Bit services будет собирать Логгги с каждой Ноды и Стримить их в ElasticSearch.

`helm install fluent-bit stable/fluent-bit --namespace=logs --set backend.type=es --set backend.es.host=elasticsearch-client`{{execute}}

Fluent Bit запускается и станет доступным через несколько минут. А пока перейдите к следующему шагу установки
