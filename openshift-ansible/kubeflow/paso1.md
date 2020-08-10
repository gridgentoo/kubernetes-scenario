El proyecto Kubeflow está dedicado a hacer que el Aprendizaje automático sea fácil de configurar con Kubernetes, portátil y escalable. El objetivo no es recrear otros servicios, sino proporcionar una manera directa de combinar las mejores soluciones OSS de su clase. Kubernetes es una plataforma de código abierto para automatizar la implementación, el escalado y la administración de aplicaciones en contenedores.

Debido a que Kubeflow está basado en Kubernetes, se ejecuta dondequiera que Kubernetes se ejecute, como servidores bare-metal o proveedores en la nube como Google. Los detalles del proyecto se pueden encontrar en https://github.com/kubeflow/kubeflow

### Componentes de Kubeflow

Kubeflow tiene tres componentes centrales.

__TF Job Operator and Controller__: Extensión a Kubernetes para simplificar la implementación de cargas de trabajo distribuidas de TensorFlow. Al utilizar un operador, Kubeflow es capaz de configurar automáticamente la configuración del servidor maestro, trabajador y parametrizado. Las cargas de trabajo se pueden implementar con un TFJob.

__TF Hub__: Ejecución de instancias de JupyterHub, lo que le permite trabajar con Jupyter Notebooks.

__Model Server__: Despliegue de modelos capacitados de TensorFlow para que los clientes accedan y lo usen para futuras predicciones.

Estos tres modelos se utilizarán para desplegar diferentes cargas de trabajo en los siguientes pasos.