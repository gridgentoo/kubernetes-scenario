Create a namespace for the installation target.

`kubectl create namespace rabbit`{{execute}}

Provisioning RabbitMQ on Kubernetes is easy, just install this [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install my-rabbit stable/rabbitmq-ha --namespace rabbit -f rabbit-values.yaml`{{execute}}

The RabbitMQ containers take a few minutes to start. To get a complete status of provisioning this sequence, run this inspection.

`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

In a few moments the 3 Pods (RabbitMQ _Nodes_) labeled `pod/my-rabbit-rabbitmq-ha-[0|1|2]` will appear and move to the _Running_ status. Once all are running, discontinue the watch. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
