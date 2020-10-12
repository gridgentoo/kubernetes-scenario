In this section you will verify that your installation is running fine 

# Health Check 

Check your `PATH`  have been updated accoundingly

`echo $PATH`{{execute}}


Verify the java version you are running. 
`java -version `{{execute}}

The java version is explicit and should be similar to the following output 
```
openjdk version "11.0.6" 2020-01-14
OpenJDK Runtime Environment GraalVM CE 20.0.0 (build 11.0.6+9-jvmci-20.0-b02)
OpenJDK 64-Bit Server VM GraalVM CE 20.0.0 (build 11.0.6+9-jvmci-20.0-b02, mixed mode, sharing)
```

Explore the content of the GRAALVM installation directory 

`cd /opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}`{{execute}} <br>
display files and subdirectories<br>
`ls -rtl `{{execute}}

The directory contains the following folders
* `bin`: includes binaries like `java`, `javac`, `javadoc` ...
* `conf`: .properties and configurations files
* `tools`: contains a set of utilities like `chromeinspector`, `profiler`
* `include`: store C-language header files that support native code *.h , like  `jni.h``
* `jmods`: contains compiled modules definitions
* `legal`: the copyrigth and licence files for each modules 
* 