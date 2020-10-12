
# Running with GRAAL JVMCI Compiler 

Run the following command to start the benchmark with GraalVM  
 
`java  -jar target/benchmarks.jar `{{execute}}

> Here we are not using the  `-XX:-UseJVMCICompiler` 

This way, GRAAL will be used as the JVMCI compiler instead of the default one used in the previous step.

The final console output should be similar to the following lines:
```
Benchmark                             Mode  Cnt    Score     Error  Units
JavaSimpleStreamBenchmark.testMethod  avgt    3  314.249 ? 627.944  ns/op`
```

The programs is at least  faster when running with GRAAL Compiler.
