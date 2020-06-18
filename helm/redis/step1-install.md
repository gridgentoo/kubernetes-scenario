Helm - это инструмент администрирования кластера, который управляет **charts** в **Kubernetes**.

**Helm** использует формат упаковки **packaging** который называется **charts**. **Charts** определяют состав связанных ресурсов **Kubernetes resources** и **Kubernetes values**, которые составляют решение для развертывания. **Charts** - это **source code**, который можно упаковывать, создавать версии и поддерживать в системе контроля версий. Внутри **chart** находятся файлы **Kubernetes YAML** вместе с языком шаблонов **templating language**, позволяющим вставлять контекстные **values** в **YAMLs**.

Helm также помогает вам управлять сложностями управления зависимостями **dependency**. **Charts** могут включать зависимости от других **charts**. **Charts** дополняют ваши процессы [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code). Эффективно используйте **Helm** со зрелым конвейером управления версиями **container versioning pipeline**.

Инструмент **Helm CLI** развертывает **charts** в **Kubernetes**. Серверный компонент **server side component**  может принять **chart** и отправить декларации **YAML** в **Kubernetes**. **Chart**  является развертываемой единицей, которую можно проверять, перечислять, обновлять **updated**  и удалять **removed**

Этот сценарий охватывает версию **3.x of Helm**. Если вы используете версию **2.x**, настоятельно рекомендуется перейти на последнюю версию.

Взаимодействие с **Helm** запускается с помощью инструмента командной строки (**CLI**). **Helm** можно установить по адресу https://github.com/kubernetes/helm/releases.

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash `{{execute}}

В этот момент **Helm**  должен быть **healthy**

`helm version --short`{{execute}}

По умолчанию список **public repositories** репозиториев **Helm** **initially empty**. Подробнее об этом позже, но сейчас можно добавить репозиторий **Google**.

`helm repo add stable https://kubernetes-charts.storage.googleapis.com/`{{execute}}

Текущее местное состояние **Helm** хранится в вашей среде в **home location**.

`helm env`{{execute}}

По умолчанию команда **Helm** обнаруживает **host**, уже заданный в **~/.kube/config**. Существует способ изменить или переопределить хост, но это выходит за рамки этого сценария.

Следующий шаг становится правильным, установив **pre-made chart**.
