Используйте команду Minikube _start_, чтобы подготовить кластер Kubernetes с одним узлом (single node Kubernetes).

`minikube start`{{execute}}

Кластер запускается через мгновение или два. Эти Katacoda servers работают довольно быстро, и работа на local machine  с командой _start_, скорее всего, будет медленнее. Тем не менее, [Moore's Law](https://en.wikipedia.org/wiki/Moore%27s_law) всегда корректирует наши ожидания.

Когда приглашение prompt  вернется, убедитесь, что Minikube запущен.

`minikube status`{{execute}}

Он работает на одной машине..

`minikube ip`{{execute}}

И не должно быть ничего заметного в журналах logs.

`minikube logs`{{execute}}

Кластер minikube, можно остановить и запустить.

`minikube stop`{{execute}}

`minikube status`{{execute}}

`minikube start`{{execute}}

`minikube status`{{execute}}

Вы можете удалить кластер Minikube, но не делайте этого, так как нам нужно больше изучить Minikube

`minikube delete`

Обычно вы также можете войти в Minikube, но этот Katacoda instance ограничивает это для защиты безопасности.

`minikube ssh`
