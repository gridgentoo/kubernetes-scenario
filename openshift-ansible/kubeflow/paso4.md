TfJob proporciona un recurso personalizado de Kubeflow que facilita la ejecución de trabajos TensorFlow distribuidos o no distribuidos en Kubernetes. El controlador TFJob toma una especificación YAML para un maestro, servidores de parámetros y trabajadores para ayudar a ejecutar el cálculo distribuido.

Una definición de recursos personalizada (CRD) proporciona la capacidad de crear y administrar Jobs de TF de la misma manera que los objetos nativos de Kubernetes. Una vez desplegado, el CRD puede configurar el Job de TensorFlow, lo que permite a los usuarios centrarse en el aprendizaje automático en lugar de la infraestructura.

## Creación de una definición de despliegue TFJob

Para implementar la carga de trabajo TensorFlow descrita en el paso anterior, Kubeflow necesita una definición de TFJob. En este escenario, podemos verlo ejecutando `cat example.yaml`{{execute}}

La definición define tres componentes:

__Master__: Cada job debe tener un master. El master coordinará la ejecución de las operaciones de entrenamiento entre workers.

__Worker__: Un job puede tener de 0 a N workers. Cada proceso del worker ejecuta el mismo modelo, proporcionando parámetros para procesar a un Parameter Server.

__PS__: un job puede tener de 0 a N servidores de parámetros. El Parameter Server le permite escalar nuestro modelo en múltiples máquinas.

Podemos encontrar más información en https://www.tensorflow.org/deploy/distributed

## Despliegue de un TFJob

El TFJob se puede desplegar ejecutando `kubectl apply -f example.yaml`{{execute}}

Al desplegar el job, Kubernetes programará las cargas de trabajo para su ejecución en los nodos disponibles. Como parte del despliegue, Kubeflow configurará TensorFlow con las configuraciones requeridas permitiendo que los diferentes componentes se comuniquen entre sí.

En el siguiente paso se explicará el Job y cómo acceder a los resultados.