Al ser Kubeflow una extensión de Kubernetes, todos los componentes deben desplegarse en la plataforma.

A continuación se muestra una secuencia de comandos de instalación que utiliza Ksonnet para implementar Kubeflow en un clúster Kubernetes existente. Ksonnet requiere un token de Github válido. Lo siguiente puede ser usado dentro de Katacoda. Ejecute el comando para establecer la variable de entorno requerida.
`export GITHUB_TOKEN=99510f2ccf40e496d1e97dbec9f31cb16770b884`{{execute}}

Una vez establecida, ya podemos ejecutar el script de instalación:

```
export KUBEFLOW_VERSION=0.2.5
curl https://raw.githubusercontent.com/kubeflow/kubeflow/v${KUBEFLOW_VERSION}/scripts/deploy.sh | bash
```{{execute}}

Deberíamos ver los pods de Kubeflow iniciándose.

`kubectl get pods`{{execute}}

## Creación de volúmenes persistentes y servicios para Katacoda

Para asegurarnos que Kubeflow se ejecuta correctamente en Katacoda, debemos desplegar las siguientes extensiones.

`kubectl apply -f ~/kubeflow/katacoda.yaml`{{execute}}

Esto creará un LoadBalancer y un Persistent Volume requeridos por Kubeflow. Esto variará dependiendo de nuestro entorno.