Kubectl is a command-line interface for managing a Kubernetes cluster and its resources. In this section, you will learn about the most common commands and their use cases.

The syntax for all the commands follows this convention:


```kubectl <COMMAND> <RESOURCE_TYPE> <RESOURCE_NAME> <OPTIONS>```

Commands in angle brackets <> mean the following:

- COMMAND: An action to be executed against one or more resources.
- RESOURCE_TYPE: The type of resource to be acted upon, for example, a pod or service.
- RESOURCE_NAME: The name of the resource(s) to manage.
- OPTIONS: Various flags used to modify the behavior of kubectl commands. They have higher priority than default values and environment variables, thus overriding them.
