### Optional

We can retrieve and start the executable JAR file.

For Gradle, scroll down for that section.

#### Maven Alternative

The location of the created JAR file can be seen at the end of the build console output:

```console
[INFO] Building jar: /var/jenkins_home_local/workspace/GitHub Triggered Build/target/camel-spring4-0.0.1-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 08:15 min
[INFO] Finished at: 2017-01-03T13:13:06+00:00
[INFO] Final Memory: 37M/263M
[INFO] ------------------------------------------------------------------------
Finished: SUCCESS
```

Let us test the executable JAR:

`docker exec -it jenkins bash
java jar "/jenkins_home_alpine/workspace/Github Triggered Build/target/camel-spring4-0.0.1-SNAPSHOT.jar"`{{execute}}

![image](https://user-images.githubusercontent.com/558905/38008731-4100dd88-321e-11e8-8559-8cb42c6b4fb4.png)

Okay, the jar is not executable yet. Let us change the POM file to create an executable fat JAR as described on Mkyong’s page:

```
$ git clone https://github.com/oveits/simple-restful-file-storage
$ cd simple-restful-file-storage
$ vi pom.xml
```

Add the following text to the plugins-part of `pom.xml`: cloning the git repository, adding the text below to the plugins part, adding `pom.xml` to git, commit the git change and push the change:

```xml
<!-- Maven Assembly Plugin -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-assembly-plugin</artifactId>
        <version>2.4.1</version>
        <configuration>
          <!-- get all project dependencies -->
          <descriptorRefs>
            <descriptorRef>jar-with-dependencies</descriptorRef>
          </descriptorRefs>
          <!-- MainClass in mainfest make a executable jar -->
          <archive>
            <manifest>
            <mainClass>de.oveits.simplerestfulfilestorage.MainApp</mainClass>
            </manifest>
          </archive>

        </configuration>
        <executions>
          <execution>
          <id>make-assembly</id>
          <!-- bind to the packaging phase -->
          <phase>package</phase>
          <goals>
            <goal>single</goal>
          </goals>
          </execution>
        </executions>
      </plugin>
```

For other projects, you will need to adapt the part in <mainClass> above.

Then:

`$ git add pom.xml`{{execute}}
`$ git commit -m "Maven creates fat executable JAR file now"`{{execute}}
`$ git push`{{execute}}


Now again, let us build the project: click on the Build Now, then check the Console Output.

Now there are many downloads, and it takes a while:

![2017-01-05-01_18_33-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997327-7f279088-31e8-11e8-9d8c-fdeb24124d3f.png)

After ~2.5 minutes, it is ready:

![2017-01-05-01_19_25-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997308-7e2ca2d6-31e8-11e8-81cc-d30f146571f7.png)

And we can find and run the new fat JAR file on the Docker container:

`docker exec -it jenkins bash ls -ltr jenkins_home_alpine/workspace/GithubTriggeredBuild/target`{{execute}}

```
total 57680
drwxr-xr-x 3 jenkins jenkins     4096 Jan  3 13:12 generated-sources
drwxr-xr-x 6 jenkins jenkins     4096 Jan  3 13:12 classes
drwxr-xr-x 3 jenkins jenkins     4096 Jan  3 13:12 generated-test-sources
drwxr-xr-x 3 jenkins jenkins     4096 Jan  3 13:12 test-classes
drwxr-xr-x 2 jenkins jenkins     4096 Jan  3 13:13 maven-archiver
-rw-r--r-- 1 jenkins jenkins    44657 Jan  4 23:58 camel-spring4-0.0.1-SNAPSHOT.jar
drwxr-xr-x 2 jenkins jenkins     4096 Jan  5 00:00 archive-tmp
-rw-r--r-- 1 jenkins jenkins 58988354 Jan  5 00:00 camel-spring4-0.0.1-SNAPSHOT-jar-with-dependencies.jar
```

Here, we can see, that a large JAR file with all dependencies has been created. Now let us try to execute it:

`docker exec -it jenkins bash java jar jenkins_home_alpine/workspace/GithubTriggeredBuild/target/camel-spring4-0.0.1-SNAPSHOT.jar`{{execute}}

```
17/01/05 00:07:50 INFO main.MainSupport: Apache Camel 2.16.0 starting
0 [main] INFO org.apache.camel.main.MainSupport  - Apache Camel 2.16.0 starting
...
17/01/05 00:07:52 INFO spring.SpringCamelContext: Total 15 routes, of which 15 is started.
2420 [main] INFO org.apache.camel.spring.SpringCamelContext  - Total 15 routes, of which 15 is started.
17/01/05 00:07:52 INFO spring.SpringCamelContext: Apache Camel 2.16.0 (CamelContext: camel-1) started in 0.876 seconds
2422 [main] INFO org.apache.camel.spring.SpringCamelContext  - Apache Camel 2.16.0 (CamelContext: camel-1) started in 0.876 seconds
```

Yes. perfect, it seems to work!

You can stop the Apache Camel process by pressing <CTRL>-C in the console.


#### Gradle Alternative

Let us see, where the executable jar file can be found:

For that, let us enter a bash session on the same Docker container:

`docker exec -it jenkins bash java jar "/jenkins_home_alpine/workspace/Github Triggered Build/target/camel-spring4-0.0.1-SNAPSHOT.jar"`{{execute}}

In case you have started Jenkins with the jenkins image (Step 1.2, alternative (A)), the project will be found on

`cd /var/jenkins_home`{{execute}}

In case you have started Jenkins with the oveits/jenkins_tutorial image the project will be found on:

`cd /var/jenkins_home_local`{{execute}}

Then enter the Project. In my case “GitHub Triggered Build”

`cd 'GitHub Triggered Build'`{{execute}}

The jar is found on the path defined in build.gradle file (default: build/libs).

`cd build/libs
ls`{{execute}}

```
GitHub Triggered Build-0.0.1-SNAPSHOT.jar   META-INF   lib   log4j.properties   properties   templates
```

Now let us start the executable file:

`java -jar "GitHub Triggered Build-0.0.1-SNAPSHOT.jar"`{{execute}}

```
[main] MainSupport  INFO  Apache Camel 2.16.0 starting
0 [main] INFO org.apache.camel.main.MainSupport  - Apache Camel 2.16.0 starting
[main] DefaultTypeConverter INFO  Loaded 196 type converters
1706 [main] INFO org.apache.camel.impl.converter.DefaultTypeConverter  - Loaded 196 type converters
...
2762 [main] INFO org.apache.camel.spring.SpringCamelContext  - Total 15 routes, of which 15 is started.
[main] SpringCamelContext   INFO  Apache Camel 2.16.0 (CamelContext: camel-1) started in 1.046 seconds
2765 [main] INFO org.apache.camel.spring.SpringCamelContext  - Apache Camel 2.16.0 (CamelContext: camel-1) started in 1.046 seconds
```

Yes. perfect, it seems to work.

You can stop the Apache Camel process by pressing <CTRL>-C in the console.
