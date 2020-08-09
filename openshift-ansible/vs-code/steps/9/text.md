### Jinja sum filter

К данным можно применять **Filters** для их изменения. Например, **sum filter** может суммировать данные, **escape filter** экранирует их, а **sort filter** сортирует их.
Создадим **sum_filter.py**
```
#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader

cars = [
    {'name': 'Audi', 'price': 23000}, 
    {'name': 'Skoda', 'price': 17300}, 
    {'name': 'Volvo', 'price': 44300}, 
    {'name': 'Volkswagen', 'price': 21300}
]

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('sumprices.txt')

output = template.render(cars=cars)
print(output)
```

В этом примере мы используем **sum filter** для вычисления суммы всех цен на автомобили **car prices**.
```
cars = [
    {'name': 'Audi', 'price': 23000}, 
    {'name': 'Skoda', 'price': 17300}, 
    {'name': 'Volvo', 'price': 44300}, 
    {'name': 'Volkswagen', 'price': 21300}
]
```

У нас есть список **list** автомобильных словарей **car dictionaries**. У каждого словаря **dictionary** есть ключ цены **price key**. Он будет использован для расчета суммы.

Создадим **templates/sumprices.txty**
```
The sum of car prices is {{ cars | sum(attribute='price') }}
```

В файле **template** мы применяем фильтр к объекту коллекции автомобилей **cars collection**. Сумма рассчитывается из атрибута **price attribute**.

`python sum_filter.py`{{execute T1}}