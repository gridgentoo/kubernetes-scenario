Этот сценарий проведет вас через **Hot R.O.D.** Golang demo. Приложение **Golang** хранит информацию трассировки **stores tracing** в **Jaeger** через **API OpenTracing**.

## OpenTracing

**OpenTracing** является частью облачной основы  **cloud-native foundation**...


## Hot R.O.D.
[**Hot R.O.D.**](https://github.com/uber/jaeger/tree/master/examples/hotrod) это **mock ride-sharing system** остроенная на основе **gRPC**. 
Поскольку **requests** на поездки **rides** создаются пользователями, система создает **traces** которые хранятся в **Jaeger**.

## Jaeger

**Jaeger** - это  **tracing system** с открытым исходным кодом, созданная **Uber**. **Jaeger** позволяет разработчикам визуализировать данные **OpenTracing**.

### Opentracing, Jagger 

Есть общий стандарт **Opentracing**, который описывает как и что должно собираться, не привязываясь трассировкой к конкретной реализации в каком-либо языке. Например, в Java вся работа с трейсами ведется через общий **API Opentracing**, а под ним может скрываться, например, **Jaeger** или пустая дефолтная реализация которая ничего не делает.

У нас используется **Jaeger** как имплементация **Opentracing**. Он состоит из нескольких компонент:

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/s7IrYt1igSM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
[Uber Open Summit 2018] Jaeger: Distributed Tracing at Uber

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/fsHb0qK37bc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
Serghei Iakovlev, “Маленькая история большой победы: OpenTracing, AWS и Jaeger”

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/nHgfJ943z2I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
OpenTracing не только для распределенной трассировки. Константин Черкасов, Lazada

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/siZv8TZoMg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
Игорь Чакрыгин «Использование OpenTracing в .NET»