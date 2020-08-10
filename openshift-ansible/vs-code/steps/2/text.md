### Google Cloud :: Airflow supports using Jinja Templating.  
https://cloud.google.com/composer/docs/how-to/using/using-kubernetes-pod-operator

Одним из самых больших преимуществ использования Ansible в сочетании с существующими файлами ресурсов Kubernetes является возможность использовать шаблоны Jinja, чтобы вы могли настраивать ресурсы с помощью нескольких переменных в Ansible.   
https://docs.openshift.com/container-platform/4.1/applications/operator_sdk/osdk-ansible.html.  

Поместите значения в файл конфигурации и запустите инструмент шаблона, чтобы динамически создать файл конфигурации для основного контейнера приложения. Например, поместите значение POD_IP в конфигурацию и сгенерируйте основной файл конфигурации приложения с помощью Jinja.  
https://docs.openshift.com/container-platform/4.3/nodes/containers/nodes-containers-init.html




### Jinja tutorial - creating templates in Python with Jinja module
http://zetcode.com/python/jinja/

### Простой пример Jinja

В первом примере мы создаем очень простой шаблон **simple.py**. 
Поэтому мы используем **python** с **jinja2**, как показано ниже, создадим файл **simple.py**:
```
#!/usr/bin/env python3

from jinja2 import Template   // Импортируем объект Template из модуля jinja2.

name = input("Enter your name: ")

tm = Template("Hello {{ name }}")
msg = tm.render(name=name)

print(msg)
```

Механизм шаблонов **template engine** похож на метод **Python format ()**; но движки шаблонов более мощные и имеют гораздо больше возможностей.

`python simple.py`{{execute}}


Поэтому мы используем **python** с **jinja2**, как показано ниже, создадим файл **simple2.py**:
```
#!/usr/bin/env python3

from jinja2 import Template

name = 'Peter'
age = 34

tm = Template("My name is {{ name }} and I am {{ age }}")
msg = tm.render(name=name, age=age)

print(msg)
```

`python simple2.py`{{execute}}

