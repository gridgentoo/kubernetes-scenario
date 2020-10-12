В этом разделе вы выполните **3 iterations**
`testMethod` и зафиксируйте среднее время отклика с помощью [JMH](http://openjdk.java.net/projects/code-tools/jmh/)

# Operating with the default JVMCI Compiler 

Выполните следующую команду, чтобы запустить **benchmark** с **Hotspot JVM**

`java -XX:-UseJVMCICompiler -jar target/benchmarks.jar `{{execute}}

The `-XX:-UseJVMCICompiler` указывает **JVM** запускать программу без **GRAAL Compiler**.
Таким образом, **GRAAL** не будет использоваться в качестве **JVMCI compiler**.

Окончательный вывод консоли **console output** должен быть похож на
```
Benchmark                             Mode  Cnt    Score      Error  Units
JavaSimpleStreamBenchmark.testMethod  avgt    3  454.934 ? 1825.010  ns/op
```


