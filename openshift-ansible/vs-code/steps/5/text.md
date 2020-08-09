### Jinja raw data

Мы можем использовать необработанные маркеры конца строки raw, чтобы избежать разделителей Jinja.
Создадим **raw_data.py**

```
#!/usr/bin/env python3

from jinja2 import Template

data = '''
{% raw %}
His name is {{ name }}
{% endraw %}
'''

tm = Template(data)
msg = tm.render(name='Peter')

print(msg)
```
Используя необработанный блок **raw**, **endraw block** мы избегаем синтаксиса **Jinja {{ }}** Он напечатан в буквальном смысле.

`python raw_data.py`{{execute T1}}