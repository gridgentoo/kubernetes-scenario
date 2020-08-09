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
В этом примере **template** является файл **showpersons.txt**. Файл находится в **templates directory**.

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

Данные представляют собой список словарей **list of dictionaries**.

```
file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)
```

Мы определяем **FileSystemLoader**. Шаблон извлекается из **templates directory**.

```
template = env.get_template('showpersons.txt')
```

Получаем **template** с помощью метода **get_template()**.

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

