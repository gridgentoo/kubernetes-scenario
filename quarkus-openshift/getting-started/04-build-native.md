Давайте теперь создадим собственный исполняемый файл **native executable** для нашего приложения. Это улучшает время запуска приложения и обеспечивает минимальный объем дискового пространства. Исполняемый файл будет иметь все для запуска приложения, включая **"JVM"** (сокращено, чтобы быть достаточным для запуска приложения) и **application**

![Native process](/openshift/assets/middleware/quarkus/native-image-process.png)

Мы будем использовать **GraalVM**, который включает собственный компилятор **native compiler** для создания собственных **native images** для ряда языков, включая Java. Он будет инсталлирован для вас:

`echo $GRAALVM_HOME`{{execute}}

## Build native image

Внутри `getting-started/pom.xml`{{open}} находится декларации для плагина **Quarkus Maven**, который содержит **profile** для `native-image`:

```xml

    <profile>
      <id>native</id>
      <activation>
        <property>
          <name>native</name>
        </property>
      </activation>
      <build>
        <plugins>
          <plugin>
            <artifactId>maven-failsafe-plugin</artifactId>
            <version>${surefire-plugin.version}</version>
            <executions>
              <execution>
                <goals>
                  <goal>integration-test</goal>
                  <goal>verify</goal>
                </goals>
                <configuration>
                  <systemProperties>
                    <native.image.path>${project.build.directory}/${project.build.finalName}-runner</native.image.path>
                  </systemProperties>
                </configuration>
              </execution>
            </executions>
          </plugin>
        </plugins>
      </build>
      <properties>
        <quarkus.package.type>native</quarkus.package.type>
      </properties>
    </profile>

```

Мы используем **profile**, потому что, как вы скоро увидите, упаковка исходного **native image** занимает несколько секунд. Однако это время компиляции происходит только _once_, а не _every_  время запуска приложения, что имеет место в случае других подходов для создания и выполнения **JAR** -файлов.

Создайте собственный исполняемый файл **native executable**, кликнув: `mvn clean package -Pnative -DskipTests=true`{{execute}}

> Поскольку в этой среде мы работаем под **Linux**, и **OS**, которая в конечном итоге будет запускать наше приложение, также является **Linux**, мы можем использовать нашу локальную **OS** для создания собственного приложения **native Quarkus app**. Если вам нужно собрать собственные двоичные файлы **Linux**, когда вы работаете в других ОС, таких как **Windows** или **Mac OS X**, вы можете использовать `-Dquarkus.native.container-runtime=[podman | docker]`. Вам понадобится либо **Docker**, либо [Podman](https://podman.io) в зависимости от того, какую среду выполнения контейнера вы хотите использовать!

Это займет около минуты, чтобы закончить. Подождите это!

В дополнение к обычным файлам, сборка также производит `target/getting-started-1.0-SNAPSHOT-runner`. Это родной двоичный файл Linux:

`file target/getting-started-1.0-SNAPSHOT-runner`{{execute}}

```console
$ file target/getting-started-1.0-SNAPSHOT-runner
target/getting-started-1.0-SNAPSHOT-runner: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=f3975244b096e24dc0f6a001f4599acd4a0a70a8, not stripped
```

## Run native image

Поскольку наша среда здесь **Linux**, вы можете просто запустить ее _just run it_:

`target/getting-started-1.0-SNAPSHOT-runner`{{execute}}

Обратите внимание на удивительно быстрое время запуска:

```console
2019-03-07 18:34:16,642 INFO  [io.quarkus] (main) Quarkus 0.21.1 started in 0.004s. Listening on: http://[::]:8080
2019-03-07 18:34:16,643 INFO  [io.quarkus] (main) Installed features: [cdi, resteasy]
```
Это 4 миллисекунды. A _mere 4000 nanoseconds_.

И крайне низкое использование памяти **low memory usage**, как сообщает утилита Linux `ps`. Нажмите здесь, чтобы запустить это на другой вкладке **Terminal tab**:

`ps -o pid,rss,command -p $(pgrep -f runner)`{{execute T2}}

Вы должны увидеть что-то вроде:

```console
  PID   RSS  COMMAND
 4831 14184 target/getting-started-1.0-SNAPSHOT-runner
```

Это показывает, что наш процесс занимает около **13.8 MB** памяти ([Resident Set Size](https://en.wikipedia.org/wiki/Resident_set_size), or RSS). Довольно компактно!

> Обратите внимание, что использование RSS и памяти в любом приложении, **including Quarkus**, будет различаться в зависимости от конкретной среды и будет возрастать по мере загрузки приложения.

Убедитесь, что приложение **app** все еще работает должным образом (на этот раз мы будем использовать `curl` для прямого доступа к нему):

`curl http://localhost:8080/hello/greeting/quarkus`{{execute T2}}

> Это автоматически откроет и запустит `curl` в отдельном терминале. Вы также можете открыть дополнительные терминалы с помощью кнопки «+» на панели вкладок справа.

```console
curl http://localhost:8080/hello/greeting/quarkus
hello quarkus from master
```

Nice!

## Cleanup

Перейдите на первую вкладку **Terminal tab** и нажмите `CTRL-C`, чтобы остановить наше нативное приложение **native app**.

## Поздравляем!

Теперь вы создали приложение **Java application** в виде исполняемого файла **JAR** и **Linux native binary**. Теперь давайте передадим суперспособности нашего приложения, развернув их в **OpenShift** как образ контейнера **Linux container image**.

