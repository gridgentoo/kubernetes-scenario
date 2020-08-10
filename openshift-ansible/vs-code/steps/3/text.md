###  Конвертирование json2yaml.py.

Для начала создадим ***JSON**-файл **example.json**, например, его можно взять на **json.org**:
https://json.org/example.html

создадим файл **example.json**:
```
{
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
```
Затем создадим простой скрипт-конвертор и сохраним его под именем **json2yaml.py**. 
Этот скрипт импортирует оба модуля — **YAML** и **JSON Python**, а также загружает указанный пользователем файл **JSON**, 
выполняет конвертирование и пишет данные в файл **output.yaml**.  

создадим файл **json2yaml.py**:
```
#!/usr/bin/python3
import yaml
import sys
import json

OUT=open('output.yaml','w')
IN=open(sys.argv[1], 'r')

JSON = json.load(IN)
IN.close()
yaml.dump(JSON, OUT)
OUT.close()
```

`python3 json2yaml.py example.json`{{execute T1}}



### Jinja objects

Мы можем работать с объектами в наших строках шаблона, как показано ниже,   
создадим файл **objects.py**:
```
#!/usr/bin/env python3

from jinja2 import Template

class Person:

    def __init__(self, name, age):

        self.name = name
        self.age = age

    def getAge(self):
        return self.age

    def getName(self):
        return self.name    


person = Person('Peter', 34)

tm = Template("My name is {{ per.getName() }} and I am {{ per.getAge() }}")
msg = tm.render(per=person)

print(msg)
```

В этом примере мы определяем объект **Person**. Мы получаем имя и возраст через два геттера **getters**.

`python objects.py`{{execute T1}}



