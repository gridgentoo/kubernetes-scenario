
#### Python
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

Linux (shell pipe) 

############################################################

Предположим, вам нужен шаблон файла конфигурации, **kuber.j2**:

`vi kuber.j2`{{execute T1}}

```yaml
kubernets {

  limit: {{ quantum_bit.kuber_limit }};

}
```
И у вас есть файл **JSON** с данными, **kuber.json**:

`vi kuber.json`{{execute T1}}

```yaml
{
    "quantum_bit":{

        "kuber_limit": "256"
    }
}
```

Отрендерим его в рабочий файл конфигурации **kuber.yaml** :

`j2 -f json kuber.j2 kuber.json > kuber.yaml`{{execute T1}}


`vi kuber.yaml`{{execute T1}}

```yaml
kubernets {

  limit: 256 ;

}
```

############################################################

Как **Helm charts** могут принимать внешние параметры, определяемые файлом **values.yaml**, 
так и при Шаблонизации с помощью **jinja2**  параметры мы передаем в шаблон **nginx.j2** с помощью **JSON**

######################################################

Создадим файл **nginx.json**

`vi nginx.json`{{execute}}

######################################################

И у вас есть файл JSON с данными, nginx.json:

```yaml
{
    "quantum_bit":{

        "kuber_limit": "256"
    }
}
```
######################################################


Создадим файл **nginx.j2**

`vi nginx.j2`{{execute}}

######################################################

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 5
  selector:
    matchLabels:
      app: nginx
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.8.1
        ports:
        - containerPort: 80
        resources:
          limit: {{ quantum_bit.kuber_limit }};
          
```

##############################################################

`j2 -f json nginx.j2 nginx.json > nginx.yaml`{{execute T1}}


Затем создадим простой скрипт-конвертор и сохраним его под именем **json2yaml.py**. 
Этот скрипт импортирует оба модуля — **YAML** и **JSON Python**, а также загружает указанный пользователем файл **JSON**, 
выполняет конвертирование и пишет данные в файл **output.yaml**, в нашем случае выводить будем в **nginx.yaml**.

создадим файл **json2yaml.py**:
`vi json2yaml.py`{{execute T1}}

```yaml
#!/usr/bin/python3
import yaml
import sys
import json

OUT=open('nginx.yaml','w')
IN=open(sys.argv[1], 'r')

JSON = json.load(IN)
IN.close()
yaml.dump(JSON, OUT)
OUT.close()
```

`python3 json2yaml.py nginx.json`{{execute T1}}

После применения скриптов, на **Выходе** получим **nginx.yaml**

`vi nginx.yaml`{{execute T1}}

############################################################

Справка по [kubectl edit](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)


Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

#########################################################

