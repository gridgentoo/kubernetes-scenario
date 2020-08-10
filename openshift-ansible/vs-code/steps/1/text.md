Google Cloud :: Airflow supports using Jinja Templating.  
https://cloud.google.com/composer/docs/how-to/using/using-kubernetes-pod-operator

Одним из самых больших преимуществ использования Ansible в сочетании с существующими файлами ресурсов Kubernetes является возможность использовать шаблоны Jinja, чтобы вы могли настраивать ресурсы с помощью нескольких переменных в Ansible.
https://docs.openshift.com/container-platform/4.1/applications/operator_sdk/osdk-ansible.html.

Поместите значения в файл конфигурации и запустите инструмент шаблона, чтобы динамически создать файл конфигурации для основного контейнера приложения. Например, поместите значение POD_IP в конфигурацию и сгенерируйте основной файл конфигурации приложения с помощью Jinja.  
https://docs.openshift.com/container-platform/4.3/nodes/containers/nodes-containers-init.html

Using Apache Airflow to Create Data Workflows on Google Cloud.  
https://www.youtube.com/watch?v=0E25VQWjWG0

Running Airflow Inside Google Gloud Platform  
https://www.youtube.com/watch?v=AInGKrL4diA

#### Python
В этой среде **environment** вы можете проверить, что Python уже установлен, запустив `python3 --version`{{execute T1}}

Для локальной разработки и запуска кода **Python** рекомендуется использовать виртуальную среду **Python virtual environment**. 
Выполните следующие команды, чтобы создать и активировать виртуальную среду с именем `.venv`.

`apt-get update`{{execute T1}}

`yes | apt-get install python3-venv`{{execute T1}}

`python3 -m venv .venv`{{execute T1}}

`source .venv/bin/activate`{{execute T1}}

В терминале с активированной виртуальной средой  **virtual environment** выполните следующую команду в начальной папке, чтобы установить зависимости. 
Некоторые этапы установки могут занять несколько минут.

`pip install --upgrade pip`{{execute T1}}

Jinja2 - это современный и удобный для разработчиков язык шаблонов для Python, созданный по образцу шаблонов Django. 

`pip install Jinja2`{{execute T1}}

Для работы с YAML в Python используется модуль PyYAML. Он не входит в стандартную библиотеку модулей, поэтому его нужно установить:

`pip install PyYAML`{{execute T1}}

Список пакетов установленых в виртуальное окружение

`pip freeze`{{execute T1}}


### КАК ИСПОЛЬЗОВАТЬ Jinja2 с YAML
### На этом этапе мы настроим редактор **VScode** и **clone repository**.

Клонируйте следующий репозиторий, скопировав и выполнив следующую команду в **vscode terminal**.

`git clone https://github.com/athertahir/kafka.git`{{execute}}

#### Permissions

Теперь перейдите в каталог, содержащий сценарии для установки kafka, скопируйте и выполните команду. Нам также необходимо изменить разрешение **permission** на выполнение скрипта с помощью  **chmod**.

`cd kafka/setup && chmod 755 *.sh`{{execute T1}} 

`./install.sh && ./start.sh && cd ../Chapter03/monedero`{{execute T1}} 

**Note:**
- Команды, представленные на следующих шагах, ДОЛЖНЫ запускаться из подкаталога **`Chapter03/monedero`** клонирования репозитория **kafka**. 
- **Final code** для этого сценария уже был клонирован с github. Вы можете просто понять код приложения на следующих шагах и запустить его, следуя инструкциям.
- Кликните **IDE Editor** чтобы открыть **Visual Studio**, и выберите проводник, как показано ниже::

![](https://github.com/fenago/katacoda-scenarios/raw/master/apache-kafka/1.JPG)

### КАК ИСПОЛЬЗОВАТЬ Jinja2 с YAML

############################################
## Dictionaries
**Note:**
- Команды, представленные на следующих шагах, ДОЛЖНЫ запускаться из подкаталога **`Chapter03/monedero`** клонирования репозитория **kafka**. 

Jinja позволяет использовать удобную точечную нотацию для доступа к данным в **Python dictionaries**.
Создадим **limit_fluent.py**

```
#!/usr/bin/env python3

from jinja2 import Template

# берем строку в cls1.env, окружения Spring
# LIMITS_FLUENT={"cpu": "300m", "memory": "400Mi"}
lim={"cpu": "300m", "memory": "400Mi"}

tm1 = Template("cpu {{ lim.cpu }}")
tm2 = Template("memory {{ lim.memory }}")

msg1 = tm1.render(lim=lim)
msg2 = tm2.render(lim=lim)

print(msg1)
print(msg2)
```

У нас есть **limit_fluent dictionary**. 
Мы получаем доступ к **dictionary keys** например **{{ lim.cpu }}** или **{{ lim.memory }}** помощью оператора точки **dot operator**.

`python3 limit_fluent.py`{{execute T1}}

