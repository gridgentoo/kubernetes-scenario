In this section

## Playing with native images


### VM version

The following command can be used to retreive teh VM used to produce the native-image  
` $ strings helloworld | grep com.oracle.svm.core.VM`{{execute}}


### Timing operations
native images are faster than the original java program 

`time java -jar target/native-helloworld-1.0-SNAPSHOT-jar-with-dependencies.jar  Foo=Bar  John=Doe  JVM=Graal`{{execute}}

```
...
real    0m4.229s
user    0m0.235s
sys     0m0.043s
```

` time  ./helloworld Foo=Bar  John=Doe  JVM=Graal`{{execute}}
```
...
real    0m0.003s
user    0m0.000s
sys     0m0.003s
```

For this specific sample, the amount of CPU time spent in user mode is almost 0 for the native image call.
the helloworld native image is 150X faster than the execution from java command.


### Verbose mode 

While running the same image builder command with `--verbose` you can 
see the following arguments and parameters used to build the native image.
```
Build on Server(pid: 11617, port: 34403)
SendBuildRequest [
-task=com.oracle.svm.hosted.NativeImageGeneratorRunner
-imagecp
/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/llvm-platform-specific-shadowed.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/pointsto.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/llvm-wrapper-shadowed.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/objectfile.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/graal-llvm.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/svm-llvm.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/javacpp-shadowed.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/builder/svm.jar:/opt/graalvm-ce-java11-20.0.0/lib/svm/library-support.jar:/home/scrapbook/tutorial/graalvm-examples/native-helloworld/target/native-helloworld-1.0-SNAPSHOT-jar-with-dependencies.jar
-H:Path=/home/scrapbook/tutorial/graalvm-examples/native-helloworld
-H:Class=org.graalvm.demos.HelloWorld
-H:CLibraryPath=/opt/graalvm-ce-java11-20.0.0/lib/svm/clibraries/linux-amd64
-H:Name=helloworld
```


For more information please read
[GraalVM Native Image manual](https://www.graalvm.org/docs/reference-manual/native-image/)
[Native image options](https://docs.oracle.com/en/graalvm/enterprise/19/guide/reference/native-image.html)