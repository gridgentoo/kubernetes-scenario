
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

