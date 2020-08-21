
Затем создадим простой скрипт-конвертор и сохраним его под именем **json2yaml.py**. 
Этот скрипт импортирует оба модуля — **YAML** и **JSON Python**, а также загружает указанный пользователем файл **JSON**, 
выполняет конвертирование и пишет данные в файл **output.yaml**, в нашем случае выводить будем в **configmap2.yaml**.

### Конвертор **json2yaml**.

создадим файл **json2yaml.py**:
`vi json2yaml.py`{{execute T1}}

```yaml
#!/usr/bin/python3
import yaml
import sys
import json

OUT=open('configmap2.yaml','w')
IN=open(sys.argv[1], 'r')

JSON = json.load(IN)
IN.close()
yaml.dump(JSON, OUT)
OUT.close()
```

`python3 json2yaml.py configmap.json`{{execute T1}}


После применения скриптов, на **Выходе** получим **nginx.yaml**

`vi configmap2.yaml`{{execute T1}}

#########################################################


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




















