### Jinja conditionals

(**Conditionals are expressions**) Условные выражения - это выражения, которые вычисляются при выполнении определенного условия.
Создадим **conditionals.py**
```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

persons = [
    {'name': 'Andrej', 'age': 34}, 
    {'name': 'Mark', 'age': 17}, 
    {'name': 'Thomas', 'age': 44}, 
    {'name': 'Lucy', 'age': 14}, 
    {'name': 'Robert', 'age': 23}, 
    {'name': 'Dragomir', 'age': 54}, 
]

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)
env.trim_blocks = True
env.lstrip_blocks = True
env.rstrip_blocks = True

template = env.get_template('showminors.txt')

output = template.render(persons=persons)
print(output)
```

В примере печатаются только несовершеннолетние лица; несовершеннолетний - это лицо моложе 18 лет.
```
env.trim_blocks = True
env.lstrip_blocks = True
env.rstrip_blocks = True
```

(**White space**) Пробел в выводе можно контролировать с помощью атрибутов среды **environment attributes**
Создадим **templates/showminors.txt**
```
{% for person in persons %}
    {% if person.age < 18 %}
        {{- person.name }}
    {% endif %}    
{%- endfor %}
```

В **template** мы выводим только лиц моложе 18 лет, используя выражение **if expression**.

`python conditionals.py`{{execute T1}}
