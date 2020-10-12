In this step, we build the sample project to be use as input for the native image.

## Environment Setup

>  ** Please wait for GraalVM Community Edition 20.0.0 (Java11) and Maven 3 to be installed on your environment ...**


## Get the native-helloworld sample project

Clone the demo repository <br>
`git clone https://github.com/nelvadas/graalvm-examples.git `{{execute}}

## Explore the sample project

Move to the `native-helloworld` project
`cd graalvm-examples/native-helloworld `{{execute}}

Open the sample java source `./graalvm-examples/native-helloworld/src/main/java/org/graalvm/demos/HelloWorld.java`{{open}}


In this main class, we assume for example we are building a command line tool where user will provide a set of parameter

`HelloWorld.sh  param1=value1 foo=bar`

* we retreive the argv arguments from the main method and keep it it in a Property object (`commandOptions`) using a Spring utility method `StringUtils.splitArrayElementsIntoProperties`
* We serialize the `commandOptions` object in XML format to the standard output
  `commandOptions.storeToXML(System.out, ...)`


## Build the native-helloworld jar with maven assembly plugin
Build the project as a single jar with its dependency using the maven assembly plugin 
` mvn clean package`{{execute}}

Run the java program using java command 
`java -jar target/native-helloworld-1.0-SNAPSHOT-jar-with-dependencies.jar  Foo=Bar  John=Doe  JVM=Graal`{{execute}}

Your output should looks like 
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
<comment>User input parameters</comment>
<entry key="JVM">Graal</entry>
<entry key="Foo">Bar</entry>
<entry key="John">Doe</entry>
```

In the next steps, we will build a Native image  to run this program.

