What about the JRE that loaded into Alpine. So far we have simply installed the JRE into the Alpine container. Surely, someone has already figured out the be way to install and configure some version of the JRE onto Alpine. To do this right would seem a bit complicated and redundant is everyone was doing this. Like many solution in software engineering we stand on the taller and stronger shoulders of experts who come before us. Yes, there are open source solutions for getting the JRE efficiently and safely onto Alpine.

## Portola ##

The [Portola project](https://openjdk.java.net/projects/portola/), as part of the OpenJDK project, is one collection of experts who are continuing to solve the distillation of the JRE into containers.

https://blog.gilliard.lol/2018/11/05/alpine-jdk11-images.html
https://github.com/AdoptOpenJDK/openjdk-docker
https://aboullaite.me/protola-alpine-java/


## Build ##

TODO: build with multi-stage using Portola container

