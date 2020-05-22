Up to this point, we have just been using Java version 8. The newer versions of Java work much better in containers.

The distillation pattern is all producing a customized JRE that is stripped down to the bare essentials based on the dependency needs of your application. This is also the goal of high cohesion in software architecture. Those things that are needed should be in the container, those things never used, should be removed. In conjunction with the evolution of containers so too has the Java ecosystem been evolving to adapt to this new type of target. Java's project _Jigsaw_ and the move to modularize the JRE starting with Java 9 has been timely and fortunate.

## Java 9+ Modularity ##

It's unlikely our applications, even our ginormous monolithic WARs. do not use every feature found in the JRE. So would these extra modules appear in our container? For instance, if our code or 3rd party libraries never imported the `import java.sql` then Java 9 modularization allows us to strip out the JDBC API.

Starting with Java 9, two helpful utilities were added called JDeps and JLink to assist in finding used modules and excluding unused modules. These tools enable the distillation pattern with the JRE.

### JDeps ###
JDeps analyzes your application classpath(s) and itemizes all of the dependencies and core Java features your application references. With this information, you now know what modules you need and don't need in your container. Special lists are needed for those things reflective.

### JLink ###
JLink, in conjunction with the JDeps analysis, generates a custom and tuned package that includes only the JRE modules deemed necessary along with your application. Think of it as a customized JRE.

In the next step we will use JLink to create a stripped-down, modularized JRE distribution and place that into an Alpine container.
