This step explores how to host an operator repository on your local system.

Build the local index file.

`kubectl kudo repo index ~/repo`{{execute T1}}

Start the Repository HTTP server. The server is started in a separate terminal so you can see the log messages.

```bash
cd ~/repo
python -m SimpleHTTPServer 80&
```{{execute T2}}

Add the local repository to the KUDO client.

`kubectl kudo repo add local http://localhost`{{execute T1}}

Set the local repository to the default KUDO context.

`kubectl kudo repo context local`{{execute T1}}

Confirm the KUDO context.

`kubectl kudo repo list`{{execute T1}}

The * next to local indicates that it is the default context for the KUDO client.

Verify you are using the local repository for an installation. Using the verbose CLI output flag (-v) with KUDO it is possible to trace from where an operator is being installed from.

`kubectl kudo install first-operator -v 9`{{execute T1}}

The output will indicate the operator is now running, albeit locally. You will also see appropriate output in the second terminal tab running the Python http server.

The end result of this Operator that you have written is there are two new Nginx Pods running. In step 3 you created a declaration for the Nginx servers, but did not directly submit them to Kubernetes. Instead when you deployed the Operator it took care of those management details. It's a simple example, but it works.

`kubectl get deployments,pods`{{execute}}

Congratulations, we hope you see how you can continue with this KUDO framework to create more [interesting operators such as these](https://kudo.dev/#get-kudo-operators).
