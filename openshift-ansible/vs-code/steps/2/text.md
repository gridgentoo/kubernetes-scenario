### Jinja for expressions

Выражение **for** используется для перебора **data collection** в шаблоне.

Теперь мы больше не используем простой **string template**. Мы используем текстовый файл, который загружается с помощью **FileSystemLoader**.
Создадим **for_expr.py**
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



Данные представляют собой список словарей **list of dictionaries**.
Напишем в отформатированном виде:
```
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

`mkdir templates`{{execute T1}}

В этом примере **template** является файл **showpersons.txt**. Файл находится в **templates directory**.
Создадим **templates/showpersons.txt**
```
{% for qm_connections in qm_connections -%}
    {{ qm_connections.hostname }} {{ qm_connections.port }}
{% endfor %}
```

В файле **template** мы используем выражение **for** для перебора **collection**. Показываем имя **person's name** и возраст человека **age**. 
Символ тире **dash** рядом с символами **%** используется для управления пробелом.

`python3 for_expr.py`{{execute T1}}

Вывести больше параметров **(*.env)**
```
{% for qm_connections in qm_connections -%}
    {{ qm_connections.hostname }} {{ qm_connections.port }} {{ qm_connections.channel }} {{ qm_connections.queueManager }}
{% endfor %}
```

`python3 for_expr.py`{{execute T1}}

Вывести параметры **(*.env)** в другом виде
```
{% for qm_connections in qm_connections -%}
    {{ qm_connections.hostname }} {{ qm_connections.port }} 
{% endfor %}

{% for qm_connections in qm_connections -%}
    {{ qm_connections.channel }} {{ qm_connections.queueManager }}
{% endfor %}
```

`python3 for_expr.py`{{execute T1}}

###############################################################

В этом примере template является файл qm_connections.txt. Файл находится в templates directory.
```
qm_connections=[
       {"hostname": "cloud.google.com", "port": 1490, "channel": "ISTIO.CONNF", "queueManager": "MDM.ADP1"},
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

#################################################.  
###   Пример, конвертирование JSON в YAML
#################################################.  

Python-скриптом, который сгенерирует YAML. 
Этот способ лучше всего подходит для небольших наборов данных. 
Вы просто пишите JSON-данные в переменную Python, предваряете это директивой import, 
а в конце файла добавляете три строчки для реализации вывода.
Cоздадим файл **json2yaml.py**:
```
#!/usr/bin/python3	
import yaml 

d={
"glossary": {
  "title": "example glossary",
  "GlossDiv": {
	"title": "S",
	"GlossList": {
	  "GlossEntry": {
		"ID": "SGML",
		"SortAs": "SGML",
		"GlossTerm": "Standard Generalized Markup Language",
		"Acronym": "SGML",
		"Abbrev": "ISO 8879:1986",
		"GlossDef": {
		  "para": "A meta-markup language, used to create markup languages such as DocBook.",
		  "GlossSeeAlso": ["GML", "XML"]
		  },
		"GlossSee": "markup"
		}
	  }
	}
  }
}

f=open('output.yaml','w')
f.write(yaml.dump(d))
f.close
```
`python3 json2yaml.py`{{execute}}

Теперь запускаем это файл на Python-е и на выходе получаем файл output.yaml:
`cat output.yaml`{{execute}}
