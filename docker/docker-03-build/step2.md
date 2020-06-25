У нас есть четыре инструкции в нашем **Dockerfile**. Значит ли это, что в нашем **image** четыре слоя?

Запустите **docker inspect** на **image**, которое мы только что создали, чтобы узнать:

`docker inspect --format='{{range .RootFS.Layers}} {{println . -}} {{end}}' timurimage:auto`{{execute}}

У нас всего два слоя **two layers**. Зачем?

По-видимому, первый слой - это само базовое **image**. Давайте докажем, что:

`docker inspect --format='{{range .RootFS.Layers}} {{. -}} {{end}}' alpine:latest`{{execute}}

**output** должен соответствовать одному из двух слоев **two layers** в нашем **timurimage:auto**. Это правильно. Так, каков другой **layer**?

Идентификатор слоя **layer ID**  - это хэш **hash** содержимого, хранящегося в файловой системе. Только когда инструкция что-то меняет в файловой системе (в нашем случае **RUN**), создается новый слой **layer**. **USER** и **CMD** только изменяли метаданные **image**, поэтому они не создавали никаких дополнительных слоев **layers**.

В общем, чем меньше слоев в **image**, тем меньше будет размер **image**. Помните, что фактические данные **actual data stored**, хранящиеся в слое **layer**, отличаются от его родителя. Таким образом, даже если ваша инструкция **RUN** приводит к удалению группы файлов, размер **image ** увеличивается, поскольку для сохранения требуется дополнительный набор **diff**.

Хорошей практикой написания **Dockerfile** является объединение нескольких инструкций **RUN** в одну, например:

    RUN apt-get update \
     && apt-get install -y \
        aufs-tools \
        automake \
        build-essential \
     && rm -rf /var/lib/apt/lists/*

[Узнайте больше о **Dockerfile best practices**](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
