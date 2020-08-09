
## Есть параметры, которые соответствуют каждому **Template,** чтобы затем создать список объектов **OpenShift**

Наш  **`ruby-example-template`** имеет только один параметр: **`NAMESPACE_BUILD`**. 

Создадим файл параметров для установки этого **value**:

```
echo 'NAMESPACE_BUILD=ruby-example' > params/ruby/build
```{{execute}}

Теперь создадим параметры для **Project template**:

```
cat <<EOM >params/projectrequests/project
NAMESPACE=ruby-example
NAMESPACE_DISPLAY_NAME="Ruby Example"
EOM
```{{execute}}