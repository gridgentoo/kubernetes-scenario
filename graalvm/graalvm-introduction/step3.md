**Graal VM** поставляется с набором компонентов, включенных в базовые пакеты **core packages**,
некоторые другие компоненты не являются частью этого ядра **core** и должны устанавливаться отдельно с помощью **graal-updater**.

## Task

**gu list** перечислит компоненты вашей установки Graal:  

`gu list`{{execute}}


```
ComponentId              Version             Component name      Origin
--------------------------------------------------------------------------------
js                       20.2.0              Graal.js
graalvm                  20.2.0              GraalVM Core
```

Проверьте пакеты, доступные в удаленном каталоге **GraalVM remote**

`gu available `{{execute}}

Инсталлируйте **`native-image`** , **`python`** и **`R`**  

`gu install python native-image R`{{execute}} 

Еще раз проверьте установленные пакеты:  

` gu list `{{execute }}

```
ComponentId              Version             Component name      Origin
--------------------------------------------------------------------------------
js                       20.2.0              Graal.js
graalvm                  20.2.0              GraalVM Core
R                        20.2.0              FastR               github.com
llvm-toolchain           20.2.0              LLVM.org toolchain  github.com
native-image             20.2.0              Native Image        github.com
python                   20.2.0              Graal.Python        github.com
```

Инсталлируйте **`ruby`**

`gu install ruby`{{execute}} 

Еще раз проверьте установленные пакеты:  

` gu list `{{execute }}

Теперь новый список должен быть похож на следующий.

```
$ gu list
ComponentId              Version             Component name      Origin
--------------------------------------------------------------------------------
js                       20.2.0              Graal.js
graalvm                  20.2.0              GraalVM Core
R                        20.2.0              FastR               github.com
llvm-toolchain           20.2.0              LLVM.org toolchain  github.com
native-image             20.2.0              Native Image        github.com
python                   20.2.0              Graal.Python        github.com
ruby                     20.2.0              TruffleRuby         github.com
```

Высокопроизводительная реализация языка программирования R, построенная на GraalVM.

https://github.com/oracle/fastr

Высокопроизводительная реализация языка программирования Ruby. Построен на GraalVM от Oracle Labs.

https://github.com/oracle/truffleruby