(Из документации Docker)

> A `Dockerfile` - это текстовый документ, который содержит **all the commands** , которые **user** может вызвать в командной строке для сборки **image**.

> Используя `docker build`, **users** могут создать автоматическую сборку, которая последовательно выполняет несколько команд **command-line instructions**.

`docker images -a`{{execute}}

Давайте посмотрим на наш первый **Dockerfile**:

`cat ~/timurimage/Dockerfile`{{execute}}

    FROM alpine:latest

    RUN adduser -D timur
    USER timur

    CMD echo "Hello from Timur's image!"`

**Dockerfile** всегда начинается с инструкции **FROM**, которая указывает **base image** для использования. В этом примере мы придерживаемся **alpine:latest**.

* Инструкция **RUN** говорит Докеру, выполнить команду, например, для создания пользователя **timur**.

* **USER** сообщает Докеру, что пользователь должен запускаться, как при создании контейнера из этого **image**.

* Наконец, **CMD** указывает команду по умолчанию, запускаемую при создании контейнера. Его можно переопределить, добавив в конец команду **docker run**, которую вы уже видели в предыдущих сценариях.

Запустите 

`docker build -t timurimage:auto ~/timurimage/`{{execute}} 

чтобы создать **image** с именем **timurimage:auto**. 
Путь в конце командной строк **command line** is the **build context**. По умолчанию **Docker** будет искать файл с именем **Dockerfile** по этому пути.

Как видно из выходных данных, Docker запускает временный контейнер (`---> Running in <container-id>`) для каждой инструкции в  `Dockerfile`,  
выполняет инструкцию и фиксирует ее как **temporary image** (`---> <image-id>` below each `Running in`).

Эти временные **images **видны через `docker images -a`{{execute}}

Теперь попробуйте запустить контейнер из этого **image**:

`docker run --rm timurimage:auto`{{execute}}

`docker run --rm timurimage:auto whoami`{{execute}}

`docker run --rm -u nobody timurimage:auto whoami`{{execute}}

`docker run --rm timurimage:auto echo "Hej hej."`{{execute}}

[Read more about Dockerfile](https://docs.docker.com/engine/reference/builder/)

[Read more about docker build](https://docs.docker.com/engine/reference/commandline/build/)
