# Введение в Kapitan

Добро пожаловать в это введение в ***Kapitan***. 
***Kapitan*** предустановлен в этой среде.

Шаблонизаторы: сейчас это **Jinja2, Jsonnet, Kadet**. Они берут инвентарь и создают файлы (**yaml, json**, документация или **bash**-скрипты).

**Kapitan** поддерживает следующие типы входных шаблонов:
 - **jinja2**
 - **jsonnet**
 - **kadet (alpha)**
 - **helm (alpha)**

Мы открыли для себя **jsonnet**, Дейва Каннингема (**Dave Cunningham**) для шаблонизации **yaml/json** на объектно-ориентированном языке.

https://habr.com/ru/company/southbridge/blog/442844/

Приведенный ниже фрагмент, взятый из примера класса **elasticsearch**, объявляет, какие параметры необходимы для компонента **elasticsearch**:

$ cat inventory/classes/component/elasticsearch.yml

```
parameters:
  elasticsearch:
    image: "quay.io/pires/docker-elasticsearch-kubernetes:5.5.0"
    java_opts: "-Xms512m -Xmx512m"
    replicas: 1
    masters: 1
    roles:
      master:
        image: ${elasticsearch:image}
        java_opts: ${elasticsearch:java_opts}
        replicas: ${elasticsearch:replicas}
        masters: ${elasticsearch:masters}
      data:
        image: ${elasticsearch:image}
        java_opts: ${elasticsearch:java_opts}
        replicas: ${elasticsearch:replicas}
        masters: ${elasticsearch:masters}
      client:
        image: ${elasticsearch:image}
        java_opts: ${elasticsearch:java_opts}
        replicas: ${elasticsearch:replicas}
        masters: ${elasticsearch:masters}
      ingest:
        image: ${elasticsearch:image}
        java_opts: ${elasticsearch:java_opts}
        replicas: ${elasticsearch:replicas}
        masters: ${elasticsearch:masters}
```

https://kapitan.dev/inventory/#example-elasticsearch

Как показано выше, в инвентаре вы можете ссылаться на значения с помощью синтаксиса **${obj_name:key_name}** (не нужно указывать ключ параметров).

https://kapitan.dev/inventory/


Чтобы увидеть альтернативные инструкции по установке, ознакомьтесь с документацией на нашем веб-сайте: https://kapitan.dev

Посетите https://medium.com/@alessandro.demaria, чтобы увидеть последние сообщения в блоге о Kapitan.

[London, Исходный конд на github] https://github.com/deepmind/kapitan

[London, Исходный конд на github] https://github.com/ademariag?tab=repositories


