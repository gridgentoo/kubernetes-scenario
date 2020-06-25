Инструкции **ADD** и **COPY** используются для добавления файлов к **image.**

Взгляните на наш **Dockerfile.2**:

`cat ~/timurimage/Dockerfile.2`{{execute}}

    FROM alpine:latest

    RUN adduser -D timur
    USER timur
    WORKDIR /home/timur/

    ADD *.txt ./
    CMD cat *.txt

* Инструкция **WORKDIR** устанавливает рабочию директорию в **/home/timur/** для последующих инструкций.

* Затем инструкция **ADD** копирует все файлы **.txt** в **build context** в **/home/timur/** **image**.

Запустите **docker build** с аргументом **--file**, чтобы пересобрать, используя этот файл:

`docker build -t timurimage:auto --file ~/timurimage/Dockerfile.2 ~/timurimage/`{{execute}}

Теперь запустите контейнер снова и посмотрите, работает ли он:

`docker run --rm timurimage:auto`{{execute}}

> Обратите внимание, как **Docker** перезаписывает **image** с тем же тегом.  

## .dockerginore

**Automatic builds** выполняется демоном **Docker**, который иногда запускается на **remote host**. Поэтому перед началом сборки **Docker** должен передать демону все содержимое в **context directory** (specified in **docker build** command) .

Чтобы избежать ненужной передачи данных **data transfer**, рекомендуется использовать **.dockerignore**.

`echo "lackask.txt" > ~/timurimage/.dockerignore`{{execute}}

`docker build -t timurimage:auto --file ~/timurimage/Dockerfile.2 ~/timurimage/`{{execute}}

`docker run --rm timurimage:auto`{{execute}}
