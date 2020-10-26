In this step, we will deploy the IBM MQ application using the `PersistentVolumeClaim` created before.

We're going to use the community version of IBM MQ, but the following steps are equally relevant for the enterprise versions.

### Step: Deploy IBM MQ

Take a look at the IBM MQ deployment yaml:
```
echo "$(cat mq-app.yaml)"
```{{execute T1}}

Observe the `volumeMounts` and `volumes` sections where we mount the PVC.

Now use kubectl to deploy IBM MQ.
```
kubectl create -f mq-app.yaml
```{{execute T1}}

### Step: Verify IBM MQ pod is ready

Below commands wait until the IBM MQ pod is in ready state.
```
watch kubectl get pods -o wide
```{{execute T1}}

When the pod is in Running state then then hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.