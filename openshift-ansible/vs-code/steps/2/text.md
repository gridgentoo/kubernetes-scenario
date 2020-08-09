# Jinja tutorial - creating templates in Python with Jinja module
http://zetcode.com/python/jinja/

В первом примере мы создаем очень простой шаблон **simple.py**. 
Поэтому мы используем **python** с **jinja2**, как показано ниже, создадим файл **simple.py**:
```
#!/usr/bin/env python3

from jinja2 import Template   // Импортируем объект Template из модуля jinja2.

name = input("Enter your name: ")

tm = Template("Hello {{ name }}")
msg = tm.render(name=name)

print(msg)
```

Механизм шаблонов **template engine** похож на метод **Python format ()**; но движки шаблонов более мощные и имеют гораздо больше возможностей.

`python jin.py`{{execute}}

In this scenario, we will work with our fictitious company that is dedicated to the exchange of cryptocurrencies. If we remember in the previous scenario, the messages of Monedero were validated.



In this context, we understand enrichment as adding extra data that was not in the original message. In this scenario, we will see how to enrich a message with geographic location using the MaxMind database and how to extract the current value of the exchange rate using the Open Exchange data. If we remember the events that we modeled for Monedero, each one included the IP address of the customer's computer.


This scenario covers the following topics:

- How extraction works
- How enrichment works
- Extracting the location given an IP address
- Extracting the currency price given a currency
- Enriching messages with a currency price
- Running a processing engine