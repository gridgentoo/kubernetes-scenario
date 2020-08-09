### Jinja template inheritance

(**Template inheritance**) Наследование шаблонов - это мощная функция, которая уменьшает дублирование кода и улучшает организацию кода. 
Мы определяем **base template**, от которого наследуем в других файлах **template files**.
Эти файлы **template files** перезаписывают определенные блоки файла базового **template file**.
Создадим **ineritance.py**
```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

content = 'This is about page'

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('about.html')

output = template.render(content=content)
print(output)
```

Мы отрендерим файл **about.html**. Он наследуется от файла **base.html**.
Создадим **base.html**
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{% block title %}{% endblock %}</title>
</head>
<body>
    {% block content%}
    
    {% endblock %}
</body>
</html>
```

В файле **base.html** мы объявляем два блока: **title** и **content**. Эти блоки будут заполнены определенными тегами **tags** и текстом в дочерних шаблонах **child templates**.

Создадим **about.html**
```
{% extends 'base.html' %}

{% block title%}About page{% endblock %}

{% block content %}
<h1>About page</h1>
<p>
    This is about page
</p>
{% endblock %}
```

Файл шаблона **about.html** наследуется от **base.html**. Он добавляет данные, относящиеся к этой странице. Мы избегаем повторения кода; мы не повторяем теги, одинаковые для обеих страниц, такие как **body**, **html** и **meta tags**.

Наследование осуществляется с помощью директивы **extends**.
```
{% extends 'base.html' %}
```

Определяем **title**.
```
{% block title%}About page{% endblock %}
```

И мы определяем **define content**.
```
{% block content %}
<h1>About page</h1>
<p>
    This is about page
</p>
{% endblock %}
```

`python ineritance.py`{{execute T1}}



