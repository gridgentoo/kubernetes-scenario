## Теперь, когда мы видим, что наше приложение **Ruby** запущено, давайте отправим его на **GitHub**, чтобы его можно было перенести в другой кластер!

```
git init
```{{execute}}

Назовите свое **branch** уникальным образом и укажите свой адрес электронной почты и имя
```
git checkout -b your-branch-name
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

```
git add .
```{{execute}}

Сделайте **commit**!
```
git commit -m "first commit"
```

Добавьте **repo**, которое мы будем использовать для передачи вашего кода
```
git remote add origin https://github.com/gridgentoo/applier-lab.git
```{{execute}}

Теперь **push** свою работуб в ветку с вашим именем на ней.
```
git push -u origin your-branch-name
```

А теперь посмотрим, как он появляется в другом кластере!
