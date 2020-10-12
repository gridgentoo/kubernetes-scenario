В этом разделе вы убедитесь, что ваша инсталяция работает нормально.

# Health Check 

Убедитесь, что ваш **`PATH`** был обновлен правильно

`echo $PATH`{{execute}}

Проверьте версию Java, которую вы используете.

`java -version `{{execute}}

Версия java является явной и должна быть похожа на следующий **output** 
```
openjdk version "11.0.8" 2020-07-14
OpenJDK Runtime Environment GraalVM CE 20.2.0 (build 11.0.8+10-jvmci-20.2-b03)
OpenJDK 64-Bit Server VM GraalVM CE 20.2.0 (build 11.0.8+10-jvmci-20.2-b03, mixed mode, sharing)
```

Изучите содержимое инсталлируемой **GRAALVM** директории

`cd /opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}`{{execute}} <br>

отображать файлы и поддиректории<br>

`ls -rtl `{{execute}}

 Директория содержит следующие папки:  
* `bin`: включает двоичные файлы, такие как `java`, `javac`, `javadoc` ...
* `conf`: .properties и файлы конфигурации
* `tools`: содержит набор утилит, таких как `chromeinspector`, `profiler`
* `include`: хранить файлы заголовков **C-language header**, которые поддерживают **native code** *.h , like  `jni.h``
* `jmods`: содержит определения скомпилированных **modules definitions**
* `legal`:  файлы копирайтов и лицензий для каждого модуля 
