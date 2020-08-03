В терминале с активированной виртуальной средой  **virtual environment** выполните следующую команду в начальной папке, чтобы установить зависимости. 
Некоторые этапы установки могут занять несколько минут.

`pip install --upgrade pip`{{execute T1}}

Jinja2 - это современный и удобный для разработчиков язык шаблонов для Python, созданный по образцу шаблонов Django. 

`pip install Jinja2`{{execute T1}}

Для работы с YAML в Python используется модуль PyYAML. Он не входит в стандартную библиотеку модулей, поэтому его нужно установить:

`pip install PyYAML`{{execute T1}}

Чтение из YAML (файл yaml_read.py):

```
import yaml
from pprint import pprint

with open('info.yaml') as f:
    templates = yaml.safe_load(f)

pprint(templates)
```

```
import yaml
config = yaml.load(open('config.yaml'), Loader=yaml.Loader)
print(config)
```


Запись объектов Python в YAML (файл yaml_write.py):

```
import yaml

trunk_template = [
    'switchport trunk encapsulation dot1q', 'switchport mode trunk',
    'switchport trunk native vlan 999', 'switchport trunk allowed vlan'
]

access_template = [
    'switchport mode access', 'switchport access vlan',
    'switchport nonegotiate', 'spanning-tree portfast',
    'spanning-tree bpduguard enable'
]

to_yaml = {'trunk': trunk_template, 'access': access_template}

with open('sw_templates.yaml', 'w') as f:
    yaml.dump(to_yaml, f, default_flow_style=False)

with open('sw_templates.yaml') as f:
    print(f.read())
```

# КАК ИСПОЛЬЗОВАТЬ Jinja2 с YAML
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

Теперь создайте шаблоны **Jinja2** для кода внутри **template/country_tmpl.py**

```
{%- for country in countries -%} 
if {{ country['name'] }}:
    print({{ country['capital'] }})
    return {{ country['capital'] }}
{% endfor %}
```

Поэтому мы используем **python** с **jinja2**, как показано ниже:
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


`pip install scipy`{{execute T1}}

`pip install numpy`{{execute T1}}

`pip install matplotlib`{{execute T1}}

`pip install pandas`{{execute T1}}

`pip install statsmodels`{{execute T1}}

`pip install sklearn`{{execute T1}}