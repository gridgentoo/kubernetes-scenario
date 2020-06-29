Приложения, разработанные для устранения ошибок **embrace failure**, являются наиболее полезными и устойчивыми к прерыванию работы пользователей. **Kubernetes embraces failure** и ваши приложения. Одна ошибка **failure**, которую можно ожидать - ваши контейнеры **will** fail. **Kubernetes** ожидает, что контейнеры потерпят крах **crash**, и перезапустит **Pod**, когда это произойдет. Когда ваше приложение балансирует нагрузку **load balancing** и распределяет отказоустойчивость **fault tolerance** между несколькими подами, целые группы пользователей должны редко подвергаться сбоям контейнера **container failures**.

Вы можете стать свидетелем гибкости **Kubernetes resilience**, целенаправленно убивая свои Поды. Масштабируйте Поды назад.

`kubectl scale deployment hello --replicas=3`{{execute}}

Get the list of running pods.

`kubectl get pods --selector=run=hello`{{execute}}

Delete one of the Pods.

`kubectl delete --now pod $(kubectl get pods --selector=run=hello | sed '2!d' | cut -d' ' -f1)&`{{execute}}

Watch how Kubernetes recovers from the glitch.

`watch kubectl get pods --selector=run=hello`{{execute}}

Wait until the 3 pods are restored. Notice one Pod has a new ID in the name. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

When a Pod is no longer running, the Kubernetes controller recognizes the different between the declared state and the reality of the cluster state. The controller will instruct the Scheduler on how to resolve the problem and the Schedular will search out the most healthy and optimum Kubelet among of the worker nodes. The Kubelet will start the new Pod. Shortly thereafter the Controller will recognize the state of the cluster now matches the declared state and peace is restored.
