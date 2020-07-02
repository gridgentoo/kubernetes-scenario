Команда **Explain** - отличный способ понять определенную структуру **resource** или **kind**. Это достигается с помощью **kubectl explain <kind>.**

`kubectl explain ns`{{execute}}

Почти все ресурсы этого высокоуровневого **high-level report** примерно одинаковы: **apiVersion**, **kind**, **metadata**, **spec**, **status information**. Чтобы получить полную структуру такого рода, используйте флаг **--recursive**.

`kubectl explain ns --recursive`{{execute}}

Обратите внимание на поле состояния **phase**. Давайте отобразим это как **output**

`kubectl get ns -o custom-columns=NAME:.metadata.name,PHASE:.status.phase`{{execute}}

**Explain** полезен для понимания структуры типов **types**, развернутых в Kubernetes. Он становится еще более полезным, когда ресурс настраивается и предоставляется другими операторами за пределами документации **Kubernetes**.

## Describe

Не путайте команду **Explain** с командой **Describe**. 
В то время как **Explain** сообщает о типе ресурса, **Describe** сообщает подробности экземпляра ресурса **instance of a resource**. 

Их легко перепутать, поэтому попробуйте команду **Describe** в пространстве имен **kube-system**, чтобы увидеть разницу.

`kubectl describe namespace kube-system`{{execute}}

Обратите внимание, что запрашивается информация о **specific instance** пространства имен, называемого **kube-system**. 
Это отличается от команды **Explain**, которая сообщает об аспектах типа ресурса.
