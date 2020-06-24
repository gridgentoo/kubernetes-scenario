На этом этапе мы запустим несколько контейнеров одного image.

# Задача
Давайте запустим еще два контейнера.

`docker run -d jpetazzo/clock`{{execute}}

> Container_ID

`docker run -d jpetazzo/clock`{{execute}}

> Container_ID

Убедитесь, что `docker ps`{{execute}} правильно сообщает обо всех контейнерах.