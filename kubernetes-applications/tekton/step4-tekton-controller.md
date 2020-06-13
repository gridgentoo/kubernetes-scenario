## Install Tekton Controller

The Tekton engine will run your pipelines. Tekton follows the [Kubernetes Operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/). Install Tekton

`kubectl apply --filename https://storage.googleapis.com/tekton-releases/latest/release.yaml`{{execute}}

Verify Tekton is running.

`watch kubectl get deployments,pods,services --namespace tekton-pipelines`{{execute}}

It's quick to start so after a few seconds the Pod will move to the _running_ state and the Deployments will move to the _available (1)_ state. Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

New Custom Resources Definitions (CRDs) have been defined for Tekton.

`kubectl get crds`{{execute}}

The Tekton Operator will define several new resources, all currently return empty lists.

`kubectl get images,pipelineruns,pipelines,taskruns,tasks,pipelineresources`{{execute}}

Next, you will define the pipeline. The pipeline is not just one file, rather it's a collection of modular and decoupled resource types that definitions the elements of your pipeline. When you define the top-level PipelineRun it references sub definitions to complete your request.

```
Pipeline Run
    Pipeline
        Tasks
            Steps
                Resources
```
