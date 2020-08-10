## Dictionaries

Jinja позволяет использовать удобную точечную нотацию для доступа к данным в **Python dictionaries**.

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
