Чтобы создать свой собственный **Docker image**, вам нужно создать **Dockerfile**.

**Dockerfile** определяет слои, которые будут собраны для создания окончательного **image.**

Давайте посмотрим на простой Dockerfile.

`cat resources/simple/Dockerfile`{{execute}}

Наш **Dockerfile** состоит из двух инструкций:

1. `FROM nginx:1.15`

    Эта инструкция сообщает **Docker**, что мы хотим расширить официальный **Nginx image**.
2. `COPY index.html /usr/share/nginx/html/index.html`

    Эта инструкция говорит **Docker** скопировать файл в **image**.

Теперь давайте создадим **image** и назовем его `simple`:

`docker build -t simple resources/simple`{{execute}}

А теперь давайте запустим контейнер на основе нашего **image**:

`docker run --name simple -d -p 80:80 simple`{{execute}}

Посетите https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/ чтобы увидеть веб-сайт. Вы должны увидеть **"Hello, World!"**.

Теперь вы можете выполнить очистку с помощью `docker stop simple && docker rm simple`{{execute}}.

> **Хотите что-нибудь попробовать?** Измените содержимое `resources/simple/index.html` и пересоберите **rebuild the image**. Запустите контейнер на основе нового **image** и убедитесь, что его содержимое изменилось.

