### Jinja objects

Мы можем работать с объектами в наших строках шаблона, как показано ниже, создадим файл **objects.py**:
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



