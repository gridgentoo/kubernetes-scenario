In this section

## Build a native image

### Requireemts OS libs
For Native image build to work, you need the `gcc`compiler and the  following libs to be available on your system `glibc-devel`, `zlib-devel`   . 
Run the following command to install 
`apt-get install -y gcc zlib1g  libglib2.0-dev `{{execute}}

### Native Image Extension
Native image feature (gu) is shipped as a separate extenion for GraalVM
Run the following command to install 
`gu install native-image`{{execute}}


### Build the native-helloworld native image

Build the native-image  
` native-image -jar target/native-helloworld-1.0-SNAPSHOT-jar-with-dependencies.jar  helloworld`{{execute}}

Your output should looks like 
```
Build on Server(pid: 12697, port: 43401)
[helloworld:12697]    classlist:     924.16 ms,  0.28 GB
[helloworld:12697]        (cap):     967.09 ms,  0.28 GB
[helloworld:12697]        setup:   1,426.31 ms,  0.28 GB
[helloworld:12697]   (typeflow):   7,618.96 ms,  0.28 GB
[helloworld:12697]    (objects):  12,421.45 ms,  0.28 GB
[helloworld:12697]   (features):     380.73 ms,  0.28 GB
[helloworld:12697]     analysis:  22,176.24 ms,  0.28 GB
[helloworld:12697]     (clinit):     277.46 ms,  0.28 GB
[helloworld:12697]     universe:   2,150.37 ms,  0.28 GB
[helloworld:12697]      (parse):   5,079.31 ms,  0.28 GB
[helloworld:12697]     (inline):   7,763.82 ms,  0.28 GB
[helloworld:12697]    (compile):  58,270.90 ms,  0.28 GB
[helloworld:12697]      compile:  72,068.08 ms,  0.28 GB
[helloworld:12697]        image:   1,775.08 ms,  0.28 GB
[helloworld:12697]        write:   1,280.19 ms,  0.28 GB
[helloworld:12697]      [total]: 101,997.13 ms,  0.28 GB
```
A new `helloworld` binary file is produced in the current directory
`ls`{{execute}}

### Run the native image 

`./helloworld Foo=Bar  John=Doe  JVM=Graal`{{execute}}
Your output should be similar like the one you had in the previous step 

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
<comment>User input parameters</comment>
<entry key="JVM">Graal</entry>
<entry key="Foo">Bar</entry>
<entry key="John">Doe</entry>
</properties>
```


