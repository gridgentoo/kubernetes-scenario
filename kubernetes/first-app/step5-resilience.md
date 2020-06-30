Приложения, разработанные для устранения ошибок **embrace failure**, являются наиболее полезными и устойчивыми к прерыванию работы пользователей. **Kubernetes embraces failure** и ваши приложения. Одна ошибка **failure**, которую могут ожидать - ваши контейнеры **will** fail.

**Kubernetes** ожидает, что контейнеры потерпят крах **crash**, и перезапустит **Pod**, когда это произойдет. Когда ваше приложение балансирует нагрузку **load balancing** и распределяет отказоустойчивость **fault tolerance** между несколькими подами, причем целые группы пользователей должны редко подвергаться сбоям контейнера **container failures**.

Вы можете стать свидетелем гибкости **Kubernetes resilience**, целенаправленно убивая свои Поды. Масштабируйте Поды назад.

`kubectl scale deployment hello --replicas=3`{{execute}}

Получить список запущенных подов.

`kubectl get pods --selector=run=hello`{{execute}}

`watch kubectl get pods,services`{{execute}}

Удалить один из подов.

`kubectl delete --now pod $(kubectl get pods --selector=run=hello | sed '2!d' | cut -d' ' -f1)&`{{execute}}

Наблюдайте, как **Kubernetes** восстанавливается после сбоя **glitch**.

`watch kubectl get pods --selector=run=hello`{{execute}}

Подождите, пока **3 pods** будут восстановлены **restored**. Обратите внимание, что один Pod имеет новый идентификатор **ID** в имени. 


Используйте это ```clear```{{execute interrupt}} чтобы выйти из режима наблюдения или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Когда **Pod** больше не работает, **Kubernetes controller** распознает разницу между объявленным состоянием **declared state** и реальностью состояния кластера **cluster state**. Контроллер проинструктирует планировщика **Scheduler** о том, как решить проблему, и **Schedular** найдет наиболее здоровый **healthy** и оптимальный **Kubelet** среди **worker nodes**. **Kubelet** запустит новый **Pod**. Вскоре после этого Контроллер распознает, что состояние кластера теперь соответствует заявленному состоянию **declared state** и **peace is restored** восстановлен.