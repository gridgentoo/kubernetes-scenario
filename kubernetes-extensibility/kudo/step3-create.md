In this step you will create an Operator using the KUDO CLI to generate the KUDO operator structure.

## Create Folder

Create a directory for the project.

`mkdir first-operator && cd first-operator`{{execute}}

Use the `package new` command to generator the source code skeleton.

`kubectl kudo package new first-operator`{{execute}}

This creates the main structure of the Operator that can be viewed using the tree command.

`tree`{{execute}}

<div class="w3-panel w3-green">
  <p>If you added the -i flag with `package new` command you would be prompted for each operator detail.</p>
</div>

## Add a Maintainer

`kubectl kudo package add maintainer "your name" your@email.com`{{execute}}

## Add a Task

`kubectl kudo package add task`{{execute}}

This command uses an interactive prompt to construct the details of the task. Here is an example interaction:

```bash
$ kubectl kudo package add task
Task Name: app
✔ Apply
Task Resource: deployment
✗ Add another Resource: n
```

## Add a Plan

`kubectl kudo package add plan`{{execute}}

This command uses an interactive prompt to construct the details of the plan. Here is an example interaction:

```bash
$ kubectl kudo package add plan
✔ Plan Name: deploy
✔ serial
Phase 1 name: main
✔ parallel
Step 1 name: everything
✔ app
✗ Add another Task: n
✗ Add another Step: n
✗ Add another Phase: n
```

## Add a Parameter

`kubectl kudo package add parameter`{{execute}}

This command uses an interactive prompt to construct the details of the parameter. Here is an example interaction:

```
$ kubectl kudo package add parameter
Parameter Name: replicas
Default Value: 2
Display Name:
Description: Number of replicas that should be run as part of the deployment
✔ false
✗ Add Trigger Plan: n
```

These above add commands have created the entirety of the first-operator with the exception of the details in the template/deployment.yaml file. To complete this operator execute the following:

```bash
cat <<EOF > operator/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: {{ .Params.replicas }}
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
          ports:
            - containerPort: 80
EOF
```{{execute}}

## Special Adjustment for Kubernetes Version

There is a small version declaration that currently needs to be added, [but will soon not be necessary.](https://github.com/kudobuilder/kudo/issues/1419). Open the `first-operator/operator/operator.yaml`{{open}} file just after the `kudoVersion: 0.10.0` line. Add this line:

`kubernetesVersion: 1.14.0`{{copy}}

That's all it takes to write a basic KUDO Operator. In the next steps well package it up and run the Operator.
