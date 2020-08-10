В этом сценарии вы узнаете больше о реактивных микросервисах **Reactive Microservices**, используя  [**Eclipse Vert.x**](https://vertx.io), одну из сред выполнения, включенных в [**Red Hat OpenShift Application Runtimes**](https://developers.redhat.com/products/rhoar).

Этот сценарий является первым в списке сценариев, которые проведут вас через создание реактивного приложения **Reactive application** с использованием **Vert.x**, иллюстрирующего, что такое **Vert.x**. Эти сценарии предлагают промежуточный практический сеанс с **Vert.x**, от первой строки кода до создания сервисов **services**, их использования и, наконец, до сборки всего в единую реактивную систему **reactive system**. Он показывает, что такое реактивные системы **reactive systems**, что такое реактивное программирование **reactive programming **и как создавать приложения на основе реактивных микросервисов **reactive microservices** (и это важно).

### The Micro-Trader Application


Разрабатываемое приложение **Vert.x** называется ``Micro-Trader`` и состоит из нескольких микросервисов, как показано ниже. Это финансовое приложение, в котором мы будем зарабатывать (виртуальные)деньги. Приложение состоит из следующих микросервисов:

* Генератор котировок **quote generator** - это абсолютно нереальный симулятор, который генерирует котировки **generates the quotes** для 3-х финансовых компаний **MacroHard**, **Divinator** и **Black Coat**. Рыночные данные **market data** публикуются в шине событий **Vert.x event bus**. Он также публикует **HTTP endpoint**  для получения текущего значения котировки **current value of the quote**.
* Трейдеры - это набор компонентов, которые получают котировки **receives quotes** от генератора котировок **quote generator** и решают, покупать или продавать конкретную акцию **share**. Чтобы принять это решение, они полагаются на другой компонент, называемый **portfolio service** Портфель.
*  Портфель - этот сервис управляет количеством акций **shares** в нашем портфеле **portfolio** и их денежной стоимостью **monetary value**. Он представлен как **service proxy** службы, то есть **asynchronous RPC service** поверх шины событий **Vert.x event bus**. Для каждой успешной операции он отправляет сообщение по шине событий **event bus** с описанием операции. Он использует генератор котировок **quote generator** для оценки текущей стоимости портфеля **value of the portfolio**.
* Аудит(**audit**) - это ведение списка всех наших операций **list of all our operations** (да, это закон). Компонент аудита получает операции от **portfolio service** через шину событий **event bus and address**. Затем он сохраняет тезисы **stores** в базе данных. Он также предоставляет конечную **REST endpoint** для получения последнего набора операций.
* **Dashboard** панель управления - некоторый **UI**, чтобы сообщить нам, когда мы станем богатыми.

### Посмотрим на архитектуру:

![Architecture](/openshift/assets/middleware/rhoar-getting-started-vertx/reactive-ms-architecture.png)

Приложение использует несколько типов сервисов - **services**:

* HTTP endpoint (i.e. REST API) - this service is located using an HTTP URL.
* gRPC - gRPC - это безопасная **secure** и быстрый **RPC framework**, построенный на основе HTTP / 2.
* **Message sources** Источники сообщений  - это компоненты, публикующие сообщения **publishing messages** на шине событий **event bus**, служба **service**  локализована с использованием (**event bus**) **address**.

Все компоненты будут развернуты в одном пространстве имен **Kubernetes namespace (project)** и образуют кластер.

На панели инструментов **dashboard** представлены доступные **services**, стоимость котировок каждой компании **company’s quotes**, последний набор операций **latest set of operations**, выполненных нашими трейдерами, и текущее состояние нашего портфеля. Он также показывает состояние различных автоматических выключателей **circuit breakers**.

![Architecture](/openshift/assets/middleware/rhoar-getting-started-vertx/dashboard.png)

### Первый микросервис **first microservice** - генератор котировок **quote generator**

В этом сценарии вы собираетесь создать первый микросервис **first microservice** - генератор котировок **quote generator**. В каждом последующем сценарии вы создадите микросервис (из **from the set above**), который вместе будет формировать приложение **Micro-Trader** на основе **Vert.x.**

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/BpjpPrH_0p0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

vert.x против классической многопоточности в JVM / Владимир Красильщик (Независимый эксперт)

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/El5VZ8_ct6Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Антон Ленок — Реактивное программирование на Vert.x