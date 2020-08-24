
#######################################
#####  Кодогенерация на Scala   #######
#######################################

```yaml
// Сгенерированные Scala-файлы из YAML-Template

-----------------------------------com.example.Data.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("application.yml"))
class Data {

@JsonProperty("application.yml")
@BeanProperty
var applicationYml: String = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}
-----------------------------------com.example.Example.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.List
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("apiVersion", "kind", "metadata", "objects", "parameters"))
class Example {

@JsonProperty("apiVersion")
@BeanProperty
var apiVersion: String = _

@JsonProperty("kind")
@BeanProperty
var kind: String = _

@JsonProperty("metadata")
@BeanProperty
var metadata: Metadata = _

@JsonProperty("objects")
@BeanProperty
var objects: List[com.example.Any] = null

@JsonProperty("parameters")
@BeanProperty
var parameters: List[Parameter] = null

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}
-----------------------------------com.example.Labels.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("type"))
class Labels {

@JsonProperty("type")
@BeanProperty
var `type`: String = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}
-----------------------------------com.example.Metadata.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("name", "labels"))
class Metadata {

@JsonProperty("name")
@BeanProperty
var name: String = _

@JsonProperty("labels")
@BeanProperty
var labels: Labels = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}
-----------------------------------com.example.Metadata_.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("name"))
class Metadata_ {

@JsonProperty("name")
@BeanProperty
var name: String = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}
-----------------------------------com.example.Object.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("apiVersion", "kind", "metadata", "data"))
class Object {

@JsonProperty("apiVersion")
@BeanProperty
var apiVersion: String = _

@JsonProperty("kind")
@BeanProperty
var kind: String = _

@JsonProperty("metadata")
@BeanProperty
var metadata: Metadata_ = _

@JsonProperty("data")
@BeanProperty
var data: Data = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}
-----------------------------------com.example.Parameter.scala-----------------------------------
package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("name", "description", "required", "from"))
class Parameter {

@JsonProperty("name")
@BeanProperty
var name: String = _

@JsonProperty("description")
@BeanProperty
var description: String = _

@JsonProperty("required")
@BeanProperty
var required: java.lang.Boolean = _

@JsonProperty("from")
@BeanProperty
var from: String = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, java.lang.Any] = new HashMap[String, java.lang.Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: java.lang.AnyRef) {
this.additionalProperties.put(name, value)
}
}

```yaml

######################################################
######################################################

```yaml
// Сгенерированные Scala-файлы из Json-файла
// Json (configmap.json)
// 

package com.example

import java.util.HashMap
import java.util.Map
import com.fasterxml.jackson.annotation.JsonAnyGetter
import com.fasterxml.jackson.annotation.JsonAnySetter
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonPropertyOrder
import scala.beans.{BeanProperty, BooleanBeanProperty}
//remove if not needed
import scala.collection.JavaConversions._

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder(Array("hostname", "port", "channel", "queueManager"))
class Example {

@JsonProperty("hostname")
@BeanProperty
var hostname: String = _

@JsonProperty("port")
@BeanProperty
var port: String = _

@JsonProperty("channel")
@BeanProperty
var channel: String = _

@JsonProperty("queueManager")
@BeanProperty
var queueManager: String = _

@JsonIgnore
@BeanProperty
var additionalProperties: Map[String, Any] = new HashMap[String, Any]()

@JsonAnySetter
def setAdditionalProperty(name: String, value: AnyRef) {
this.additionalProperties.put(name, value)
}
}
```yaml


######################################################



######################################################

Создадим файл **nginx.json**

`vi nginx.json`{{execute}}

######################################################

И у вас есть файл JSON с данными, nginx.json:

```yaml
{
    "quantum_bit":{

        "kuber_limit": "256"
    }
}
```
######################################################


Создадим файл **nginx.j2**

`vi nginx.j2`{{execute}}

######################################################

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 5
  selector:
    matchLabels:
      app: nginx
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.8.1
        ports:
        - containerPort: 80
        resources:
          limit: {{ quantum_bit.kuber_limit }};
          
```

##############################################################

**Linux (shell pipe**) для **j2cli** 

**j2cli** - интерфес командной строки CLI  для шаблонов **Template Jinja2**

`j2 -f json nginx.j2 nginx.json > nginx.yaml`{{execute T1}}

`vi nginx.yaml`{{execute T1}}

##############################################################

### Редактирование ресурсов в Кубернетес.

Вы можете отредактировать API-ресурс в любом редакторе.

`kubectl edit deployment nginx-deployment`{{execute}}

Примечание: **kubectl edit** использует vi
Чтобы войти в режим редактирования нажмите **i** 
Чтобы выйти и сохранить изменения из режима редактирования нажмите **Shift+Z** два раза

С помощью **edit** вы можете в режиме реального времени **live edit** редактировать конфигурацию ресурса в **Kubernetes**. 
Однако он не будет редактировать основной файл манифеста **Manifest**, представляющий объект.

Команда **kubectl edit** позволяет вам напрямую редактировать любой ресурс API, который вы можете получить с помощью инструментов командной строки. Он откроет редактор, определенный вашими переменными среды **KUBE_EDITOR**, или откроется на «vi» для Linux

Файлы для редактирования будут выводиться в версии API по умолчанию или в версии, указанной в **–output-version**. Формат по умолчанию - YAML - если вы хотите отредактировать в JSON, укажите **-o json**.

`kubectl edit deployment nginx-deployment -o json`{{execute}}

#########################################################

`kubectl get deployment nginx-deployment -o yaml > nginx.yaml`{{execute}}

`vi nginx.yaml`{{execute}}

#########################################################

`kubectl get deployment nginx-deployment -o json > nginx.json`{{execute}}

`vi nginx.json`{{execute}}

#########################################################

#########################################################

Существует распространенный инструмент Linux под названием **jq**. **jq** похож на **sed** для данных JSON. 

Использование **jq** может значительно облегчить чтение вывода **JSON** из **kubectl** с подсветкой синтаксиса.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

Существует также **Python json.tool**.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

`kubectl edit rs vue-rs -o json`{{execute}}

Обратите внимание, что в последней команде мы добавили  [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. 

Установив уровень 9 (самый высокий), мы получим немного больше информации о том, как команда **kubectl** получает возвращаемую информацию.

############################################################

Справка по [kubectl edit](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)


Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

#########################################################


