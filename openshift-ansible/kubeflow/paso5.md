El estado de las tareas (_jobs_) de TensorFlow se puede ver a través de `kubectl get tfjob`{{execute}}. Once the TensorFlow job has been completed, the master is marked as successful. Keep running the job command to see when it finishes.

Una vez se ha completado la tarea de TensorFlow, el maestro se marca como exitoso. Sigue ejecutando el comando de trabajo para ver cuando termina.

El _master_ es responsable de coordinar la ejecución y agregar los resultados. Internamente, las cargas de trabajo completadas se pueden listar usando `kubectl get pods | grep Completed`{{execute}}

En este ejemplo, los resultados se envían a STDOUT, que se pueden ver usando `kubectl logs`.

El siguiente comando mostrará los resultados:

`kubectl logs $(kubectl get pods | grep Completed | tr -s ' ' | cut -d ' ' -f 1)`{{execute}}

Esto nos permite ver los resultados de la ejecución de la carga de trabajo en los servidores maestro, trabajador y de parámetros.
