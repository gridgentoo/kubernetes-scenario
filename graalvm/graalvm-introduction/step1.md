GraalVM is available for Linux/Mac/Windows in two editions: 
* a Community Edition 
* An [Enteprise Edition](https://www.oracle.com/downloads/graalvm-downloads.html) with a 24/7 Premium Oracle Support.

GraalVM is shipped as a sepearate package for each supported JDK edition 

Install the Community Edition of your choice by customizing the  `JDK_VERSION` and `GRAAL_VERSION` Variables.
While writing this scenarios, the latest GRAAL CE release is `20.0.0`  with   `JDK11`.
> Feel free to update the versions as you want.


## Instalation

Select your JDK version: (default 11) <br> `export JDK_VERSION=11 `{{execute}} <br>

Select your GraalVM CE Version: (default 20.0.)<br>`export GRAAL_VERSION=20.0.0`{{execute}}


Download the Graal Binary with the following command 

`curl -L -o /tmp/graalvm-ce.tar.gz https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-java${JDK_VERSION}-linux-amd64-${GRAAL_VERSION}.tar.gz`{{execute}}

The GraalVM archive should now be available in your `tmp` folder 

`ls -rtl /tmp/`{{execute}}

Extract the tar.gz in the /opt/ folder
`tar -C /opt/ -xvf  /tmp/graalvm-ce.tar.gz`{{execute}}

Update your PATH to  include GRAAL executables

`export PATH=/opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}/bin:$PATH`{{execute}}

Your installation should be OK now.
