El segundo componente clave de Kubeflow es la capacidad de ejecutar Jupyter Notebooks a través de JupyterHub. [Jupyter Notebook](http://jupyter.org/) es la herramienta clásica en _data science_ para ejecutar inline scripts y snippets de código mientras se documenta el proceso en el navegador.
                                                                                                                                                     
Con Kubeflow, el JupyterHub se despliega en el clúster de Kubernetes, donde podemos averiguar la dirección IP del Load Balancer usando `kubectl get svc`{{execute}}

## Abrir Jupyter Hub

A través de Katacoda, podemos acceder a la interfaz del navegador en el siguiente enlace https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com o usando la pestaña del terminal *Jupyterhub*. Para acceder a JupyterHub use el nombre de usuario **`admin`{{copy}}** y una contraseña en blanco en el login.

Para implementar un _notebook_, debemos iniciar un nuevo servidor. Kubeflow usa internamente la imagen Docker  **`gcr.io/kubeflow-images-public/tensorflow-1.8.0-notebook-cpu:v0.2.1`{{copy}}** de forma predeterminada. Después de acceder a JupyterHub, podemos hacer clic en el botón **Start My server**.

El launcher del servidor le permite configurar opciones adicionales, como los requisitos de recursos. En este caso, acepte los valores predeterminados y haga clic en **Spawn** para iniciar el servidor. Ahora puede ver el contenido de la imagen de Docker que puede navegar, ampliar y trabajar con los Notebooks de Jupyter.

De manera interna, esto generará un nuevo Pod de Kubernetes llamado *jupyter-admin* para administrar el servidor. Ver esto usando `kubectl get pods jupyter-admin`{{execute}}

### Trabajando con Jupyter Notebook

Ahora podemos acceder a JupyterHub a través del pod y trabajar con el entorno sin problemas. Por ejemplo, para crear un nuevo notebook, seleccionamos _New_ en el menú desplegable y seleccionamos el kernel de Python 3 como se muestra a continuación.

<img src="/kubeflow/scenarios/deploying-kubeflow/assets/jupyterhub-create-notebook.png" alt="Creación de nuevo Jupyter Notebook">

Ahora ya podemos crear fragmentos de código. Para comenzar a trabajar con TensorFlow, pegamos el siguiente código en la primera celda y lo ejecutamos.

<pre class="file" data-target="clipboard">
from __future__ import print_function

import tensorflow as tf

hello = tf.constant('Hola TensorFlow!')
s = tf.Session()
print(s.run(hello))
</pre>
