El componente final es el [servidor del modelo](https://www.tensorflow.org/serving/). Una vez entrenado, el modelo puede usarse para realizar predicciones para los nuevos datos cuando se publiquen. Al utilizar Kubeflow, es posible acceder al servidor mediante el despliegue de _jobs_ en la infraestructura de Kubernetes.

### Despliegue de servidor de modelo entrenado

El tf-serving de Kubeflow proporciona la plantilla para servir un modelo TensorFlow. Esto se puede personalizar y desplegar utilizando Ksonnet y definiendo los parámetros según nuestro modelo.

Usando variables de entorno, estamos definiendo los nombres y la ruta donde se ubica nuestro modelo entrenado.

```
MODEL_COMPONENT=model-server
MODEL_NAME=inception
MODEL_PATH=/serving/inception-export
```{{execute}}

Usando Ksonnet, es posible extender el componente Kubeflow _tf-serving_ para que coincida con los requisitos del modelo.

```
cd ~/kubeflow_ks_app
ks generate tf-serving ${MODEL_COMPONENT} --name=${MODEL_NAME}
ks param set ${MODEL_COMPONENT} modelPath $MODEL_PATH

ks param set ${MODEL_COMPONENT} modelServerImage katacoda/tensorflow_serving
```{{execute}}

Los parámetros definidos se pueden ver a través de `ks param list`{{execute}}

Esto proporciona un script que puede desplegarse en el entorno y hacer que nuestro modelo esté disponible para los clientes.

Podemos implementar la plantilla en el clúster Kubernetes definido.

`ks apply default -c ${MODEL_COMPONENT}`{{execute}}

Los clientes ahora podrán conectarse y acceder a los datos entrenados, veamos el pod en ejecución a través de `kubectl get pods`{{execute}}

### Clasificación de imágenes

En este ejemplo, utilizamos el modelo pre-entrenado [Inception V3](https://github.com/tensorflow/models/tree/master/research/inception). Es la arquitectura entrenada en el dataset [ImageNet](http://www.image-net.org/). La tarea ML es la clasificación de imágenes, mientras que el servidor de modelos y sus clientes son manejados por Kubernetes.

Para usar el modelo publicado, necesitamos configurar el cliente. Esto se puede lograr de la misma manera que otras tareas. El archivo YAML para desplegar el cliente es `cat ~/model-client-job.yaml`{{execute}}. Para desplegarlo usaremos el siguiente comando:

`kubectl apply -f ~/model-client-job.yaml`{{execute}}

Para ver el estado de __model-client-job__ ejecutamos:

`kubectl get pods`{{execute}}

El siguiente comando generará los resultados de la clasificación para el [logotipo de Katacoda](https://katacoda.com/kubeflow/scenarios/deploying-kubeflow/assets/katacoda.jpg).

`kubectl logs $(kubectl get pods | grep Completed | tail -n1 |  tr -s ' ' | cut -d ' ' -f 1)`{{execute}}

Podemos encontrar más información sobre los servidores de modelos a través de Kubernetes en https://github.com/kubeflow/kubeflow/tree/master/components/k8s-model-server
