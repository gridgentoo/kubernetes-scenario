**GraalVM** доступен для **Linux/Mac/Windows** в двух редакциях:
* **Community Edition**
* [**Enteprise Edition**](https://www.oracle.com/downloads/graalvm-downloads.html) с круглосуточной поддержкой  24/7 Oracle Premium.

GraalVM поставляется как отдельный пакет для каждой поддерживаемой редакции JDK edition.

Установите выбранную вами версию **Community Edition**, настроив переменные  **`JDK_VERSION`** и **`GRAAL_VERSION`** 
На момент написания этого сценария последняя версия GRAAL CE release is **`20.2.0`** с **`JDK11**`.
> Не стесняйтесь обновлять версии, как хотите.

## Instalation

Выберите версию JDK: (по умолчанию 11) <br> `export JDK_VERSION=11 `{{execute}} <br>

Выберите версию GraalVM CE: (по умолчанию 20.2.0)<br>`export GRAAL_VERSION=20.2.0`{{execute}}

Загрузите **Graal Binary** с помощью следующей команды

`curl -L -o /tmp/graalvm-ce.tar.gz https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-java${JDK_VERSION}-linux-amd64-${GRAAL_VERSION}.tar.gz`{{execute}}

GraalVM теперь должен быть доступен в вашей папке **`tmp`**

`ls -rtl /tmp/`{{execute}}

Распакуйте **tar.gz** в папку **/opt/ **  

`tar -C /opt/ -xvf  /tmp/graalvm-ce.tar.gz`{{execute}}

Обновите свой **PATH**, чтобы включить исполняемые файлы **GRAAL**

`export PATH=/opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}/bin:$PATH`{{execute}}

Теперь ваша инсталяциия должна быть в порядке.
