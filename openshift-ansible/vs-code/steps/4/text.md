## Dictionaries

Jinja позволяет использовать удобную точечную нотацию для доступа к данным в **Python dictionaries**.
Создадим **dicts.py**

```
#!/usr/bin/env python3

from jinja2 import Template

person = { 'name': 'Person', 'age': 34 }

tm = Template("My name is {{ per.name }} and I am {{ per.age }}")
# tm = Template("My name is {{ per['name'] }} and I am {{ per['age'] }}")
msg = tm.render(per=person)

print(msg)
```

У нас есть **person dictionary**. Мы получаем доступ к **dictionary keys** с помощью оператора точки **dot operator**.

`python dicts.py`{{execute T1}}

############################################

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

`python3 limit_fluent.py`{{execute T1}}
