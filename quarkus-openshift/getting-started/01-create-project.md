На этом шаге вы создадите простое приложение, обслуживающее конечную точку **hello endpoint**. Чтобы продемонстрировать внедрение зависимости, эта конечная точка использует **greeting bean**

![Architecture](/openshift/assets/middleware/quarkus/arch.png)

# Создать базовый проект

Самый простой способ создать новый проект **Quarkus** - **кликните ниже**, чтобы запустить следующую команду:

`mvn io.quarkus:quarkus-maven-plugin:1.3.2.Final-redhat-00001:create \
    -DprojectGroupId=org.acme \
    -DprojectArtifactId=getting-started \
    -DplatformGroupId=com.redhat.quarkus \
    -DplatformVersion=1.3.2.Final-redhat-00001 \
    -DclassName="org.acme.quickstart.GreetingResource" \
    -Dpath="/hello"`{{execute}}

Он будет использовать плагин **Quarkus Maven** и сгенерирует базовый проект **Maven project** для вас в подкаталоге `**getting-started**`, генерируя:

* Maven структура
* Ресурс `org.acme.quickstart.GreetingResource`, представленный **exposed** в `/hello`   
* Связанный **unit** тест
* A landing page, доступная по адресу `http://localhost:8080` после запуска приложения.  
* Пример `Dockerfile`s для нативного и **jvm modes**
* Файл конфигурации приложения **configuration file** 


После того, как сгенерировано, посмотрите на `getting-started/pom.xml`{{open}}. 
Вы найдете импорт спецификации **Quarkus BOM**, позволяющий опустить версию для различных зависимостей **Quarkus**. Кроме того, вы можете увидеть **quarkus-maven-plugin**, отвечающий за упаковку приложения **packaging**, а также за предоставление режима разработки **development mode**.

```xml
 <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>${quarkus.platform.group-id}</groupId>
        <artifactId>${quarkus.platform.artifact-id}</artifactId>
        <version>${quarkus.platform.version}</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
  </dependencyManagement>

  <build>
    <plugins>
      <plugin>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-maven-plugin</artifactId>
        <version>${quarkus-plugin.version}</version>
        <executions>
          <execution>
            <goals>
              <goal>build</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>${compiler-plugin.version}</version>
      </plugin>
      <plugin>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>${surefire-plugin.version}</version>
        <configuration>
          <systemProperties>
            <java.util.logging.manager>org.jboss.logmanager.LogManager</java.util.logging.manager>
          </systemProperties>
        </configuration>
      </plugin>
    </plugins>
  </build>
```

Если мы сосредоточимся на разделе зависимостей **dependencies section,** вы увидите, что мы используем [Quarkus extensions](https://quarkus.io/extensions/), позволяющий разрабатывать и тестировать  **REST applications**:
```xml
  <dependencies>
    <dependency>
      <groupId>io.quarkus</groupId>
      <artifactId>quarkus-resteasy</artifactId>
    </dependency>
    <dependency>
      <groupId>io.quarkus</groupId>
      <artifactId>quarkus-junit5</artifactId>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>io.rest-assured</groupId>
      <artifactId>rest-assured</artifactId>
      <scope>test</scope>
    </dependency>
  </dependencies>
```

During the project creation, the `getting-started/src/main/java/org/acme/quickstart/GreetingResource.java`{{open}} file has been created with the following endpoint:

```java
@Path("/hello")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "hello";
    }
}
```
It’s a very simple REST endpoint, returning "hello" to requests on `/hello`.

> Compared to vanilla JAX-RS, with Quarkus there is no need to create an `Application` class. It’s supported but not required. In addition, only one instance of the resource is created and not one per request. You can configure this using the different `*Scoped` annotations (`ApplicationScoped`, `RequestScoped`, etc).

# Running the Application

First, change to the directory in which the project was created:

`cd /root/projects/quarkus/getting-started`{{execute}}

Now we are ready to run our application. Click here to run:

```mvn compile quarkus:dev```{{execute}}

Тебе следует увидеть:

```console
2019-02-28 17:05:22,347 INFO  [io.qua.dep.QuarkusAugmentor] (main) Beginning quarkus augmentation
2019-02-28 17:05:22,635 INFO  [io.qua.dep.QuarkusAugmentor] (main) Quarkus augmentation completed in 288ms
2019-02-28 17:05:22,770 INFO  [io.quarkus] (main) Quarkus started in 0.668s. Listening on: http://localhost:8080
2019-02-28 17:05:22,771 INFO  [io.quarkus] (main) Installed features: [cdi, resteasy]
```

Обратите внимание на удивительно быстрое время запуска! После запуска вы можете запросить указанную конечную точку **endpoint** в браузере [using this link](https://[[CLIENT_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/hello).


Тебе следует увидеть::

```console
hello
```
It's working!

Now, let's exercise the **live reload** capabilities of Quarkus. Click here to open the endpoint:  `getting-started/src/main/java/org/acme/quickstart/GreetingResource.java`{{open}}. Change `return "hello";` to `return "hola";` on line 14 in the editor. Don't save. Don't recompile or restart anything. Just try to reload the brower (or [click here](https://[[CLIENT_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/hello) again.)

You should see the updated `hola` message.

Wow, how cool is that? Supersonic Subatomic live reload! Go ahead and change it a few more times and access the endpoint again. And we're just getting started.

> `quarkus:dev` runs Quarkus in development mode. This enables live reload with background compilation, which means that when you modify your Java files your resource files and refresh your browser these changes will automatically take effect.
> This will also listen for a debugger on port `5005`. If your want to wait for the debugger to attach before running you can pass `-Ddebug` on the command line. If you don’t want the debugger at all you can use `-Ddebug=false`.

# Congratulations!

You've seen how to build a basic app, package it as an executable JAR and start it up very quickly. We'll leave the app running and rely on hot reload for the next steps.

In the next step we'll inject a custom bean to showcase Quarkus' CDI capabilities.
