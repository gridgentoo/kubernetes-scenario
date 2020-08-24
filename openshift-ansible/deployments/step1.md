
В этой среде **environment** вы можете проверить, что Python уже установлен, запустив `python3 --version`{{execute T1}}

Для локальной разработки и запуска кода **Python** рекомендуется использовать виртуальную среду **Python virtual environment**.

Выполните следующие команды, чтобы создать и активировать виртуальную среду с именем `.venv`.

`apt-get update`{{execute T1}}

`yes | apt-get install python3-venv`{{execute T1}}

`pip install --upgrade pip`{{execute T1}}

Jinja2 - это современный и удобный для разработчиков язык шаблонов для Python, созданный по образцу шаблонов Django. 

`pip install Jinja2`{{execute T1}}

**j2cli** - интерфес командной строки CLI  для шаблонов **Template Jinja2**

**j2cli[yaml]** - это инструмент командной строки на **Python-Jinja2** для создания шаблонов в сценариях **shell-scripts**.

`pip install j2cli[yaml]`{{execute T1}}

Для работы с YAML в Python используется модуль PyYAML. Он не входит в стандартную библиотеку модулей, поэтому его нужно установить:

`pip install PyYAML`{{execute T1}}

Список пакетов установленых в виртуальное окружение

`pip freeze`{{execute T1}}

############################################################

Как **Helm charts** могут принимать внешние параметры, определяемые файлом **values.yaml**, 
так и при Шаблонизации с помощью **jinja2**  параметры мы передаем в шаблон **configmap.j2** с помощью **JSON**

######################################################


######################################################
Подается на вход yml

Создадим файл **configmap.j2**

`vi configmap.j2`{{execute}}

######################################################

```yaml
apiVersion: template.openshift.io/v1

kind: Template

metadata:

  name: gateway-config-and-service-template

  labels:

    type: mq-gateways

objects:

  - apiVersion: v1

    kind: ConfigMap

    metadata:

      name: asbscorp-mq-gateway-sp-config

    data:

      application.yml: |-

        mq:

          connection:

            receiveQueue: UB.TEST.QUEUE

            sendToCustomDestination: true

            sendQueue: UB.TEST.OUT

            connections: {{connections}}



parameters:

  - name: QM_TOKEN

    description: Номер SLC

    required: false

    from: "[a-z0-9]"

  - name: QM_HOSTS

    description: Хост MQ менеджера

    required: false
```
  
######################################################
######################################################

Создадим файл **configmap.json**

`vi configmap.json`{{execute}}

######################################################
JSON форматирования

https://ru.piliapp.com/json/formatter/

######################################################
подается на вход Json 

```yaml
{
  "connections": [
    {
      "hostname": "ksh-x86-mdm-1.vm.mos.cloud.sbrf.ru",
      "port": "1490",
      "channel": "SYNAPSE.SVRCONN",
      "queueManager": "M99.ESB.MDM.PPRB.ADP1"
    },
    {
      "hostname": "ksh-x86-mdm-2.vm.mos.cloud.sbrf.ru",
      "port": "1491",
      "channel": "SYNAPSE.SVRCONN",
      "queueManager": "M99.ESB.MDM.PPRB.ADP2"
    }
  ]
}
```

######################################################
######################################################


`j2 -f json configmap.j2 configmap.json > configmap.yaml`{{execute T1}}

###########################################################
######   Как описать 100 Gitlab джоб в 100 строк на Jsonnet
######   на следующем Шаге 
######   https://habr.com/ru/post/483626/
###########################################################


