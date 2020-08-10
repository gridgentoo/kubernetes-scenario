### Jinja for expressions

Выражение **for** используется для перебора **data collection** в шаблоне.

Теперь мы больше не используем простой **string template**. Мы используем текстовый файл, который загружается с помощью **FileSystemLoader**.
Создадим **for_expr.py**
```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

persons = [
    {'name': 'Andrej', 'age': 34}, 
    {'name': 'Mark', 'age': 17}, 
    {'name': 'Thomas', 'age': 44}, 
    {'name': 'Lucy', 'age': 14}, 
    {'name': 'Robert', 'age': 23}, 
    {'name': 'Dragomir', 'age': 54}
]

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('showpersons.txt')

output = template.render(persons=persons)
print(output)
```



Данные представляют собой список словарей **list of dictionaries**.
```
persons = [
    {'name': 'Andrej', 'age': 34}, 
    {'name': 'Mark', 'age': 17}, 
    {'name': 'Thomas', 'age': 44}, 
    {'name': 'Lucy', 'age': 14}, 
    {'name': 'Robert', 'age': 23}, 
    {'name': 'Dragomir', 'age': 54}
]
```

Мы определяем **FileSystemLoader**. Шаблон извлекается из **templates directory**.
```
file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)
```

Получаем **template** с помощью метода **get_template()**.

```
template = env.get_template('showpersons.txt')
```

В этом примере **template** является файл **showpersons.txt**. Файл находится в **templates directory**.
Создадим **templates/showpersons.txt**
```
{% for person in persons -%}
    {{ person.name }} {{ person.age }}
{% endfor %}
```
The dash character next to the % characters is used to control white space.

В файле **template** мы используем выражение **for** для перебора **collection**. Показываем имя **person's name** и возраст человека **age**. 
Символ тире **dash** рядом с символами **%** используется для управления пробелом.

`python for_expr.py`{{execute T1}}

###############################################################

В этом примере template является файл qm_connections.txt. Файл находится в templates directory.
```
qm_connections=[
       {"hostname": "ccloud.google.com", "port": 1490, "channel": "ISTIO.CONNF", "queueManager": "MDM.ADP1"},
       {"hostname": "cloud.yandex.ru", "port": 1491, "channel": "ISTIO.CONNF", "queueManager": "MDM.ADP2"}
]
```
Выражение **for** используется для перебора **data collection** в шаблоне.

Теперь мы больше не используем простой **string template**. Мы используем текстовый файл, который загружается с помощью **FileSystemLoader**.
Создадим **for_expr.py**
```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

qm_connections = [
       {"hostname": "cloud.google.com", "port": 1490, "channel": "ISTIO.CONNF", "queueManager": "MDM.ADP1"},
       {"hostname": "cloud.yandex.ru", "port": 1491, "channel": "ISTIO.CONNF", "queueManager": "MDM.ADP2"}
]
file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('showpersons.txt')

output = template.render(qm_connections=qm_connections)
print(output)
```

Напишем в отформатированном виде:
```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

qm_connections = [
       {"hostname": "cloud.google.com", 
       "port": 1490, 
       "channel": "ISTIO.CONNF", 
       "queueManager": "MDM.ADP1"},
       {"hostname": "cloud.yandex.ru", 
       "port": 1491, 
       "channel": "ISTIO.CONNF", 
       "queueManager": "MDM.ADP2"}
]
file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('showpersons.txt')

output = template.render(qm_connections=qm_connections)
print(output)
```

В этом примере **template** является файл **showpersons.txt**. Файл находится в **templates directory**.
Создадим **templates/showpersons.txt**
```
{% for qm_connections in qm_connections -%}
    {{ qm_connections.hostname }} {{ qm_connections.port }}
{% endfor %}
```
Вывести больше параметров **(*.env)**
```
{% for qm_connections in qm_connections -%}
    {{ qm_connections.hostname }} {{ qm_connections.port }} {{ qm_connections.channel }} {{ qm_connections.queueManager }}
{% endfor %}
```
Вывести параметры **(*.env)** в другом виде
```
{% for qm_connections in qm_connections -%}
    {{ qm_connections.hostname }} {{ qm_connections.port }} 
{% endfor %}

{% for qm_connections in qm_connections -%}
    {{ qm_connections.channel }} {{ qm_connections.queueManager }}
{% endfor %}
```

### Суммарный фильтр **Jinja**
Вы можете применить фильтры к данным, чтобы изменить их. Например, фильтр суммы может суммировать данные, escape-фильтр может исключать их, а фильтр сортировки может их сортировать.

**sum_filter.py**

https://geek-docs.com/python/python-tutorial/python-jinja.html

http://zetcode.com/python/jinja/

```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

cars = [
    {'name': 'Audi', 'price': 23000}, 
    {'name': 'Skoda', 'price': 17300}, 
    {'name': 'Volvo', 'price': 44300}, 
    {'name': 'Volkswagen', 'price': 21300}
]

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('sumprices.txt')

output = template.render(cars=cars)
print(output)
```

В этом примере мы используем фильтр сумм для вычисления суммы всех цен на автомобили.





