
# Запуск с компилятором GRAAL JVMCI Compiler

Выполните следующую команду, чтобы запустить **benchmark** с **GraalVM**
 
`java  -jar target/benchmarks.jar `{{execute}}

> Здесь мы не используем  `-XX:-UseJVMCICompiler` 

Таким образом, **GRAAL** будет использоваться в качестве **JVMCI compiler** вместо компилятора по умолчанию, который использовался на предыдущем шаге.

Окончательный вывод консоли **console output**  должен быть похож на следующие строки:
```
Benchmark                             Mode  Cnt    Score     Error  Units
JavaSimpleStreamBenchmark.testMethod  avgt    3  314.249 ? 627.944  ns/op`
```

Как видно, программы быстрее работают с **GRAAL Compiler**.
