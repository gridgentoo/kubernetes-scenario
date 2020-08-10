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
####################################################################################
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


### КАК ИСПОЛЬЗОВАТЬ Jinja2 с YAML

Рассмотрим пример с medium.com по динамической генерации кода
Dynamic Code Generator using YAML config and Jinja2 Templates

https://medium.com/@deepak7093/dynamic-code-generator-using-yaml-config-and-jinja2-templates-31d8b9663fb0

На этом этапе мы настроим редактор **VScode**

Вот пример файла **yaml** для стран с заглавными буквами как **config.yaml**

```
--- 
  countries: 
    - name: India
      capital: Delhi
    - name: Singapore
      capital: Singapore
```

Если нам нужно сгенерировать код для условия, если имя соответствует названию страны, верните его заглавные буквы.

Теперь создайте шаблоны **Jinja2** для кода внутри **templates/country_tmpl.py**

```
{%- for country in countries -%} 
if {{ country['name'] }}:
    print({{ country['capital'] }})
    return {{ country['capital'] }}
{% endfor %}
```

Поэтому мы используем **python** с **jinja2**, как показано ниже, создадим файл **jin.py**:
```
#!/usr/bin/env python3
import yaml
from jinja2 import Environment, FileSystemLoader
if __name__ == "__main__":
 # yaml = YAML()
 config_data = yaml.load(open('./config.yaml'))
 print(config_data)
# Load templates file from templtes folder 
 env = Environment(loader = FileSystemLoader('./templates'),   trim_blocks=True, lstrip_blocks=True)
 template = env.get_template('country_tmpl.py')
 print(template.render(config_data))
```

Он сгенерирует код, как показано ниже:
```
if India:
 print(Delhi)
 return Delhi
if Singapore:
 print(Singapore)
 return Singapore
```

`python jin.py`{{execute}}


### Jinja tutorial - creating templates in Python with Jinja module
http://zetcode.com/python/jinja/

###############################################.  
### Конвертирование JSON в YAML
###############################################.  

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
`python json2yaml.py`{{execute}}

Теперь запускаем это файл на Python-е и на выходе получаем файл output.yaml:
`cat output.yam`{{execute}}
