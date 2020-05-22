Close to every 20 seconds, Chaoskube will be killing your targeted Pods. Notice as Pods are deleted, the Kubernetes resilience feature is making sure they are restored.

`watch kubectl get deployments,pods --all-namespaces -l app-purpose=chaos`{{execute}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

In a real chaos testing platform, you should complement this Pod killing activity with automated tests to ensure these disruptions are either unnoticed or acceptable for your business processes.
