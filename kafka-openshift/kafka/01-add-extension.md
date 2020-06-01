## Импортировать код

Давайте обновим код, который будем использовать. Выполните следующую команду, чтобы клонировать пример проекта:

`cd /root/projects && rm -rf rhoar-getting-started && git clone https://github.com/openshift-katacoda/rhoar-getting-started`{{execute}}

# The Project

Вы начинаете с базового приложения на основе **Maven** с обычными записями `pom.xml` для приложения **Quarkus**.

Мы также включили внешний файл HTML файл `src/main/resources/META-INF/resources/index.html`{{open}}, который будет рендерить наш поток.

# The Application You Will Build

Приложение состоит из 3 компонентов, которые передают сообщения через **Kafka** и **in-memory stream**, а затем используют **SSE** для отправки сообщений в
браузер. Это выглядит как:

![kafka](/openshift/assets/middleware/quarkus/kafkaarch.png)

## Добавить расширение

Как и другие упражнения, нам понадобится другое расширение для интеграции **Quarkus** с **Kafka**. Установите его, нажав на следующую команду:

`cd /root/projects/rhoar-getting-started/quarkus/kafka &&
  mvn quarkus:add-extension -Dextensions="kafka"`{{execute}}

>  При первом добавлении расширения новые зависимости могут быть загружены через **maven**. Это должно произойти только один раз, после этого дела пойдут еще быстрее.

Это добавит необходимые записи в ваш `pom.xml`{{open}} для добавления расширения **Kafka extension**. Вы увидите:

```xml
<dependency>
    <groupId>io.quarkus</groupId>
    <artifactId>quarkus-smallrye-reactive-messaging-kafka</artifactId>
</dependency>
```
## Live Coding

**Live Coding** (также называемый _dev mode_) позволяет нам запускать приложение и вносить изменения на лету. **Quarkus** автоматически перекомпилирует и перезагрузит приложение после внесения изменений. Это мощный и эффективный стиль **developing**, который мы считаем очень полезным.

Установив наше расширение **extension**, давайте начнем **Live Coding**. Нажмите следующую команду, чтобы запустить приложение в режиме **Live Coding**:

```mvn compile quarkus:dev```{{execute}}

Тебе следует увидеть:

```console
people 1.0-SNAPSHOT (powered by Quarkus 1.3.2.Final) started in 1.598s. Listening on: http://0.0.0.0:8080
Profile dev activated. Live Coding activated.
Installed features: [cdi, resteasy, smallrye-context-propagation, smallrye-reactive-messaging, smallrye-reactive-messaging-kafka, smallrye-reactive-streams-operators]
```

> При первом создании приложения новые зависимости могут быть загружены через **Maven**. Это должно произойти только один раз, после этого дела пойдут еще быстрее.

Обратите внимание на удивительно быстрое время запуска! Теперь приложение работает "locally" (в контейнере **Linux container**, в котором выполняется это упражнение).

Проверьте, запущено ли приложение, открыв простую конечную точку `hello`:

`cd /root/projects/rhoar-getting-started/quarkus/kafka && \
  curl http://localhost:8080/hello`{{execute T2}}

> Возможно, вам придется  click  эту команду еще раз, если она не выполняется должным образом при первом click 

Тебе следует увидеть:

```console
hello
```
Оставьте приложение запущенным, и давайте начнем добавлять к нему.
