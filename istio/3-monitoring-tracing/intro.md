Этот сценарий показывает, что вы получаете из коробки мониторинга с помощью **Prometheus** и **Grafana,** а также **Tracing**

Этот сценарий проведет вас через **Hot R.O.D.** Golang demo. Приложение **Golang** хранит информацию трассировки **stores tracing** в **Jaeger** через **API OpenTracing**.

## OpenTracing

**OpenTracing** является частью облачной основы  **cloud-native foundation**...


## Hot R.O.D.
[**Hot R.O.D.**](https://github.com/uber/jaeger/tree/master/examples/hotrod) это **mock ride-sharing system** остроенная на основе **gRPC**. 
Поскольку **requests** на поездки **rides** создаются пользователями, система создает **traces** которые хранятся в **Jaeger**.

## Jaeger

**Jaeger** - это  **tracing system** с открытым исходным кодом, созданная **Uber**. **Jaeger** позволяет разработчикам визуализировать данные **OpenTracing**.

[Архитектура] Vert.X [30 августа 2020]

https://drive.google.com/drive/folders/1PKKuAnIqLoX3IrHefyQl1BD8I22kCXz5

[Архитектура] Vert.X + Hazelcast [30 августа 2020].

https://drive.google.com/drive/folders/1wi_Kg5mKDUbftnNXPo442BOinxaSjmN6

[Архитектура] ServiceFabric Microsoft Azure [30 августа 2020]

https://drive.google.com/drive/folders/1N9P7M2eAGCtbkMrcjcfVJQkqynD1g3XZ

[Архитектура] Vert.X + Ignite [30 августа 2020]

В этом сценарии вы узнаете больше о Трейсинге реактивных микросервисах **Reactive Microservices, Vert.x**.

### Opentracing, Jagger 

Есть общий стандарт **Opentracing**, который описывает как и что должно собираться, не привязываясь трассировкой к конкретной реализации в каком-либо языке. Например, в Java вся работа с трейсами ведется через общий **API Opentracing**, а под ним может скрываться, например, **Jaeger** или пустая дефолтная реализация которая ничего не делает.

**OpenTracing** — библиотека стандартизирующая процесс добавления распределенной трассировки запросов в ваше приложения, это слой абстракции над существующими решениями такими как **Jaeger, Zipkin, Lightstep** и другими.

**Jaeger** — бекенд написанный на **Go** он занимается сбором, хранением, анализом и отображением трейсов. У него в комплекте есть **UI** в котором через браузер можно найти трейсы и провести необходимый анализ либо посмотреть путь трейса. Обратите внимание что можно смотреть не только ошибки, но и время работы каждого сервиса и общее время ответа.

Это распределенная система состоящая из нескольких компонентов:

**Agent** — рассчитан на то что будет запускаться рядом с вашими сервисами и получать от них трейсы.
**Collector** — который принимает данные от агентов и сохраняет в хранилище(Cassandar, Elasticsearch или Kafka).
**Query сервис** — обрабатывает запросы от **Jaeger UI**.
**Ingester** — Читает сообщения из **Kafka** и сохраняет в другие хранилища.

### Trace

Трассировка - это  **data/execution path**  в системе, который можно рассматривать как ориентированный ациклический граф **directed acyclic graph of spans**.

**Collectors** пишут в Кафку в качестве предварительного буфера.

У нас используется **Jaeger** как имплементация **Opentracing**. Он состоит из нескольких компонент:

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/s7IrYt1igSM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Uber Open Summit 2018] Jaeger: Distributed Tracing at Uber

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/fsHb0qK37bc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Serghei Iakovlev] “Маленькая история большой победы: OpenTracing, AWS и Jaeger”

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/nHgfJ943z2I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Константин Черкасов] OpenTracing не только для распределенной трассировки.

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/YG67VTunG_U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Игорь Чакрыгин] «Использование OpenTracing в .NET»

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/RK_ojRbpDJ4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Егор Гришечко] Zipkin&Jaeger - Распределенная трассировка запросов в .NET

### Kubernetes and OpenShift

- Kubernetes templates: https://github.com/jaegertracing/jaeger-kubernetes

- Kubernetes Operator: https://github.com/jaegertracing/jaeger-operator

- OpenShift templates: https://github.com/jaegertracing/jaeger-openshift

## Architecture Jaeger

https://www.jaegertracing.io/docs/1.18/architecture/
