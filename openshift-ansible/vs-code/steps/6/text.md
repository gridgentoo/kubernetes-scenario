### Jinja escape data

Чтобы экранировать данные, такие как символы  **< or > characters**, мы можем использовать **filter** или функцию **escape()**.

Создадим **escape_data.py**

```
#!/usr/bin/env python3

from jinja2 import Template, escape

data = '<a>Today is a sunny day</a>'

tm = Template("{{ data | e}}")
msg = tm.render(data=data)

print(msg)
print(escape(data))
```

В примере экранируются символы **< and > characters**
```
tm = Template("{{ data | e}}")
```

Используя **e filter**, данные экранируются **escaped**. Фильтры применяются с **| character**
```
print(escape(data))
```

Функция **escape** делает то же самое.

`python escape_data.py`{{execute T1}}