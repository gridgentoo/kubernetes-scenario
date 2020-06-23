
**Rabbit MQ portal** можно увидеть в браузере. Откройте свой браузер на **RabbitMQ Portal**  во вкладке над областью командной строки или по этой ссылке: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/.

Войдите с:

- user name: _guest_
- password: _guest_

# Справка по командам **Rabbit MQ**

На **Linux (debian) restart RabbitMQ** можно выполнить одной консольной командой:

`sudo service rabbitmq-server restart`{{execute}}

`sudo rabbitmqctl report`{{execute}}  #показать состояние сервера

`sudo rabbitmqctl reset`{{execute}}  #сбросить все настройки на дефолтные. Будьте осторожны: вместе с полной очисткой всех очередей также будут удалены пользователи и виртуальные хосты.

`sudo rabbitmqctl stop`{{execute}}   #остановить процесс
