# Conclusion #

**We went from a 184MB container to a 25MB container! (87% reduction)** Both containers ran the same code, from the same source, yet we were able to distill so much unneeded software out of the container. we just looked at container size, but other topics like performance and security are also important things to consider when delivering containers.

You now understand a few different techniques for efficiently getting your Java application into a container. Now it's ready to be run on Kubernetes. There are some basic ways to containerize applications that are not very efficient. With binary, native applications using GraalVM you now have more techniques to creating distilled containers. Java continues toward cloud native.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; install a container registry onto Kubernetes
- &#x2714; build and run a simple Java application
- &#x2714; build and run the same application with a container
- &#x2714; use multi-stage technique for building containers
- &#x2714; leverage Java 9+ modularity with JLink
- &#x2714; compile Java to a native binary and run it from a container
- &#x2714; start using GraalVM

## References ##

- [Gradle](https://gradle.org)
- [JLink](https://docs.oracle.com/javase/9/tools/jlink.htm)
- [GraalVM](https://www.graalvm.org/)
- [Quarkus](https://quarkus.io/)
- [Multi-stage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/)
- [WORA](https://en.wikipedia.org/wiki/Write_once,_run_anywhere)
- [PORA](https://www.theserverside.com/feature/How-the-Docker-Engine-simplifies-DevOps-from-staging-to-deployment)
- [Alpine](https://en.wikipedia.org/wiki/Alpine_Linux)
- [Alpine virtues: small, simple and secure](https://alpinelinux.org/about/)
- [Top 10 Things To Do With GraalVM](https://chrisseaton.com/truffleruby/tenthings/)
- [ListDir source](https://github.com/javajon/listdir)
- `ListDir` example code was inspired from the related article [GraalVM: Native Images in Containers](https://blogs.oracle.com/javamagazine/graalvm-native-images-in-containers) by [Oleg Šelajev](https://github.com/shelajev).

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" javajon/courses/kubernetes-containers/distillation/assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
