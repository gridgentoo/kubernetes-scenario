
GraalVM comes with a new powerfull compiler called Graal compiler .


## Environment Setup
> :warning: ** Please wait for GraalVM and Maven 3 to be installed on your environment ...**

## Build the benchmark project 

Verify Maven is up and running on your environment <br>
` mvn -version `{{execute}}

Check the installed Java version  <br>
` java --version `{{execute}}

Clone the demo repository <br>
`git clone https://github.com/graalvm/graalvm-demos.git `{{execute}}


Open the benchmark java source `./graalvm-demos/java-simple-stream-benchmark/src/main/java/org/graalvm/demos/JavaSimpleStreamBenchmark.java`{{open}}
In this file, we perform a set of streams operations on integers to compute the following expression

![ Expression](./assets/javaExpression.png)
Move to the `java-simple-stream-benchmark` maven project <br>
`cd graalvm-demos/java-simple-stream-benchmark`{{execute}}

Build the project with maven <br>
`mvn clean install `{{execute}}

In the next steps, we will be evaluating the performances of this expression towards the GraalVM new JIT compiler and the Hotspot

