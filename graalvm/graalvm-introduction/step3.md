Graal VM comes with a set of component included in the core packages, 
some others component are not part of this core and should be installed seperately using the graal-updater.

## Task

List the component of your Graal install using 
`gu list`{{execute}}


Check the packages available in the GraalVM remote catalog 
`gu available `{{execute}}

Install the `native-image` , `python` and `R`  
`gu install python native-image R`{{execute}} 

Check the installed package again 
` gu list `{{execute }}

The new list should now be similar the the following one.

```
$ gu list
ComponentId              Version             Component name      Origin
--------------------------------------------------------------------------------
graalvm                  20.0.0              GraalVM Core
R                        20.0.0              FastR               github.com
llvm-toolchain           20.0.0              LLVM.org toolchain  github.com
native-image             20.0.0              Native Image        github.com
python                   20.0.0              Graal.Python        github.com
```


