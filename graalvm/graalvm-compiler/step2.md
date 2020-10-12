In this section you will verify execute 3 iterations of the 
`testMethod` and capture the Average Response time with [JMH](http://openjdk.java.net/projects/code-tools/jmh/)

# Operating with the default JVMCI Compiler 

Run the following command to start the benchmark with Hotspot JVM 

`java -XX:-UseJVMCICompiler -jar target/benchmarks.jar `{{execute}}

The `-XX:-UseJVMCICompiler` tells the JVM to run the program  without the GRAAL Compiler.

This way, GRAAL will not be used as the JVMCI compiler and the JVM will use its default one.


The final console output should be similar to
```
Benchmark                             Mode  Cnt    Score      Error  Units
JavaSimpleStreamBenchmark.testMethod  avgt    3  454.934 ? 1825.010  ns/op
```


