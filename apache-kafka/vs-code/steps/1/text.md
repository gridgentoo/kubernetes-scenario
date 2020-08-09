На некоторых платформах может быть сложно установить среду машинного обучения **Python**. 
**Python** сначала нужно установить саму себя, а затем установить много пакетов, и это может сбить с толку.
В этом Сценарии вы узнаете, как настроить **Python machine learning**.
среда разработки.

После завершения этого урока у вас будет рабочая среда Python, чтобы начать обучение,
практику **Python machine learning** и разработка программного обеспечения для машинного обучения и глубокого обучения

#### Python
В этой среде **environment** вы можете проверить, что Python уже установлен, запустив `python3 --version`{{execute T1}}

Для локальной разработки и запуска кода **Python** рекомендуется использовать виртуальную среду **Python virtual environment**. 
Выполните следующие команды, чтобы создать и активировать виртуальную среду с именем `.venv`.

`apt-get update`{{execute T1}}

`yes | apt-get install python3-venv`{{execute T1}}

`python3 -m venv .venv`{{execute T1}}

`source .venv/bin/activate`{{execute T1}}

В терминале с активированной виртуальной средой  **virtual environment** выполните следующую команду в начальной папке, чтобы установить зависимости. 
Некоторые этапы установки могут занять несколько минут.

`pip install --upgrade pip`{{execute T1}}

Jinja2 - это современный и удобный для разработчиков язык шаблонов для Python, созданный по образцу шаблонов Django. 

`pip install Jinja2`{{execute T1}}

Для работы с YAML в Python используется модуль PyYAML. Он не входит в стандартную библиотеку модулей, поэтому его нужно установить:

`pip install PyYAML`{{execute T1}}


# КАК ИСПОЛЬЗОВАТЬ Jinja2 с YAML, На этом этапе мы настроим редактор **VScode** и **clone repository**.

Клонируйте следующий репозиторий, скопировав и выполнив следующую команду в **vscode terminal**.

`git clone https://github.com/athertahir/kafka.git`{{execute}}

#### Permissions

Теперь перейдите в каталог, содержащий сценарии для установки kafka, скопируйте и выполните команду. Нам также необходимо изменить разрешение **permission** на выполнение скрипта с помощью  **chmod**.

`cd kafka/setup && chmod 755 *.sh`{{execute T1}} 

`./install.sh && ./start.sh && cd ../Chapter03/monedero`{{execute T1}} 

**Note:**
- Команды, представленные на следующих шагах, ДОЛЖНЫ запускаться из подкаталога `Chapter03/monedero` клонирования репозитория **kafka**. 
- **Final code** для этого сценария уже был клонирован с github. Вы можете просто понять код приложения на следующих шагах и запустить его, следуя инструкциям.
- Кликните **IDE Editor** чтобы открыть **Visual Studio**, и выберите проводник, как показано ниже::

![](https://github.com/fenago/katacoda-scenarios/raw/master/apache-kafka/1.JPG)


# КАК ИСПОЛЬЗОВАТЬ Jinja2 с YAML

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


