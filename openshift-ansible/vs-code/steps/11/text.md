### Jinja Flask example

В следующем примере мы создаем простое приложение **Flask**, использующее **Jinja**.
Создадим **app.py**
```
#!/usr/bin/env python3

from flask import Flask, render_template, request
app = Flask(__name__)

@app.route("/greet")
def greet():
    username = request.args.get('name')
    return render_template('index.html', name=username)

if __name__ == "__main__":
    app.run()
```

В этом приложении **Flask** мы получаем имя пользователя и передаем его в качестве параметра методу **render_template()**. Функция **greet()** реагирует на путь **/greet**.
Создадим **templates/index.html** 
```
<!doctype html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Greeting</title>
</head>

<body>
    <p>
        Hello {{ name }}
    </p>
</body>
```

Это файл **template file**, расположенный в **templates directory**. Мы добавляем имя пользователя в файл **template file** с синтаксисом **{{ name }}**.

`python3 app.py`{{execute T1}}

Подключаемся к приложению инструментом **curl**. Добавляем параметр имени **name parameter**.
`curl http://127.0.0.1:5000/greet?name=Peter`{{execute T1}}
