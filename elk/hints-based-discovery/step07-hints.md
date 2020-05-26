### Обновите метаданные hello-java metadata

`colordiff -U6 /root/course/hello-java.yaml /root/course/hello-java-hints.yaml`{{execute HOST1}}

`kubectl apply -f /root/course/hello-java-hints.yaml `{{execute HOST1}}

### Посмотрите на изменения в Kibana
На этом этапе вы увидите, что multi-line pattern annotation была применена, и logs выглядят так, как вам бы хотелось. Исходя из Ops, я ценю то, что не нужно, чтобы кто-то с ролью администратора кластера останавливал агент, изменял конфигурацию и перезапускал ее. Использование этих annotations дает контроль над тем, что попадает в руки владельца приложения application owner. Просто обновите манифест и подайте заявку.


### View in Kibana

Откройте Kibana URL и перейдите по ссылке «Dashboard link», убедитесь, что в панели инструментов Apache и Redis заполнены.
