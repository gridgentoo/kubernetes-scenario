На предыдущем шаге вы создали базовое **Java**-приложение **RESTful** с **Quarkus**. На этом шаге мы добавим  **custom bean**, который будет использовать расширение _ArC_, которое обеспечивает внедрение зависимостей на основе **CDI** [solution](https://quarkus.io/guides/cdi-reference.html), адаптированное для архитектуры **Quarkus**.


## Добавить пользовательский Bean

Давайте изменим приложение и добавим компонент **bean**. Откройте новый файл, кликнув: `getting-started/src/main/java/org/acme/quickstart/GreetingService.java`{{open}}.

Затем кликните **Copy to Editor** , чтобы добавить следующий код в этот файл:

<pre class="file" data-filename="./getting-started/src/main/java/org/acme/quickstart/GreetingService.java" data-target="replace">
package org.acme.quickstart;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class GreetingService {

    private String hostname = System.getenv().getOrDefault("HOSTNAME", "unknown");

    public String greeting(String name) {
        return "hello " + name + " from " + hostname;
    }

}
</pre>

Затем откройте класс `getting-started/src/main/java/org/acme/quickstart/GreetingResource.java`{{open}} и затем нажмите **Copy To Editor** еще раз, чтобы добавить новый **bean**-компонент и создать новая конечную точку **endpoint**, использующая это:

<pre class="file" data-filename="./getting-started/src/main/java/org/acme/quickstart/GreetingResource.java" data-target="replace">
package org.acme.quickstart;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/hello")
public class GreetingResource {

    @Inject
    GreetingService service;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/greeting/{name}")
    public String greeting(@PathParam("name") String name) {
        return service.greeting(name);
    }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "hello";
    }
}
</pre>


## Проверьте результаты

Поскольку наше приложение все еще работает с использованием  `mvn quarkus:dev`, при внесении этих изменений и перезагрузке конечной точки **endpoint**, **Quarkus** заметит все эти изменения и перезагрузит **live reload** их в режиме реального времени.

Проверьте, работает ли он должным образом, загрузив новую конечную точку **endpoint**, нажав [clicking here](https://[[CLIENT_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/hello/greeting/quarkus).

Обратите внимание, что мы используем наш новый компонент **bean** с использованием конечной точки  `/hello/greeting`, и вы должны увидеть

```console
hello quarkus from master
```

> В этом случае `master` - это имя локального хоста **hostname of the local host**, на котором мы работаем. Это будет отличаться позже при развертывании в **OpenShift**!

## Поздравляем!

Это знакомая основанная на **CDI-based environment** среда для вас, разработчиков **Enterprise Java**, с мощными механизмами для перезагрузки вашего кода, когда вы _as you type_ (или очень близко к реальному времени). На следующем шаге мы упакуем **package** и запустим его как автономный исполняемый файл **JAR**, который также должен быть знаком разработчикам микросервисов.
