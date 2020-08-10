La capacidad principal de Kubeflow es la de desplegar fácilmente código de TensorFlow que ha sido empaquetado como una imagen Docker.

En este paso, desplegaremos nuestra primera carga de trabajo de TensorFlow que realiza una multiplicación de matriz en los _workers_ definidos y los servidores de parámetros.

Podemos ver el código de ejecución principal a continuación:

<pre class="file">
for job_name in cluster_spec.keys():
  for i in range(len(cluster_spec[job_name])):
    d = "/job:{0}/task:{1}".format(job_name, i)
    with tf.device(d):
      a = tf.constant(range(width * height), shape=[height, width])
      b = tf.constant(range(width * height), shape=[height, width])
      c = tf.multiply(a, b)
      results.append(c)
</pre>

El ejemplo completo puede verse en https://github.com/tensorflow/k8s/tree/master/examples/tf_sample
