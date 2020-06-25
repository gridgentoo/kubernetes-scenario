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

Visit https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/ to see the website. You should see "Hello, World!".

You can now cleanup with `docker stop simple && docker rm simple`{{execute}}.

> **Want to try something?** Change the contents of `resources/simple/index.html` and rebuild the image. Run a container based on the new image and see that the contents have now changed.
