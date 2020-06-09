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

* **Maven** структура
* Ресурс **org.acme.quickstart.GreetingResource**, представленный **exposed** в `/hello`   
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

Во время создания проекта `getting-started/src/main/java/org/acme/quickstart/GreetingResource.java`{{open}} файл был создан со следующей конечной точкой **endpoint**:

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
Это очень простая конечная точка **REST endpoint**, возвращающая "hello" запросам в `/hello`.

> По сравнению с ванильным **JAX-RS**, в **Quarkus** нет необходимости создавать класс `Application`. Это поддерживается, но не обязательно. Кроме того, создается только один экземпляр ресурса **one instance**, а не один на **per request**. Вы можете настроить это, используя различные аннотации `*Scoped` annotations (`ApplicationScoped`, `RequestScoped`, etc).

# Запуск приложения

Сначала перейдите в **directory**, в котором был создан проект:

`cd /root/projects/quarkus/getting-started`{{execute}}

Теперь мы готовы запустить наше приложение. Кликните здесь, чтобы запустить:

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

Теперь давайте попробуем возможности **live reload**  в **Quarkus**. Кликните здесь, чтобы открыть конечную точку **endpoint**: `getting-started/src/main/java/org/acme/quickstart/GreetingResource.java`{{open}}.. Замените `return "hello";` на `return "hola";` в строке 14 в редакторе. Не экономь, Не recompile и не перезапустите ничего. Просто попробуйте перезагрузить браузер (или [click here](https://[[CLIENT_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/hello) еще раз.)

Вы должны увидеть обновленное сообщение `hola`.

Вау, как это круто? Сверхзвуковая субатомная живая перезагрузка! Идите вперед и измените его еще несколько раз и снова получите доступ к конечной точке **endpoint**. И мы только начинаем.

> `quarkus:dev` запускает **Quarkus** в режиме **development mode**. Это дает возможность перезагрузки в реальном времени с фоновой компиляцией, что означает, что когда вы изменяете свои файлы Java, файлы ресурсов и обновляете браузер, эти изменения автоматически вступают в силу.
> Это позволит прослушивать **debugger** на порту `5005`. Если вы хотите дождаться подключения **debugger** перед запуском, вы можете передать `-Ddebug` в командной строке. Если вам вообще не нужен отладчик, вы можете использовать `-Ddebug=false`.

# Поздравляю!

Вы видели, как создать базовое приложение, упаковать его как исполняемый файл **JAR** и запустить его очень быстро. Мы оставим приложение запущенным и будем полагаться на горячую перезагрузку **hot reload** для следующих шагов.

На следующем шаге мы добавим пользовательский компонент для демонстрации возможностей **Quarkus CDI**.