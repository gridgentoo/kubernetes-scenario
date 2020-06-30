Как и любая software system, **Kubernetes** создает много логов.

На каждом ноде мы можем просмотреть **status** кублета **kubelet** (помните? Это демон, отвечающий за управление жизненным циклом пода, **Pod lifecycle management**), выполнив:

`journalctl -lu kubelet`{{execute}}

Нажмите `q`{{execute}} для выхода.

> Получите доступ к логам **kubelet** на **host01** и **host02** через SSH.

Однако мы не можем сделать это для остальных компонентов **Kubernetes**. Почему? Потому-что они работают как **pods**, а не в системе напрямую.

Для просмотра логов мы можем использовать `kubectl logs <pod name>`. 

`kubectl -n kube-system logs kube-apiserver-master`{{execute}}

или (смотрите вывод `watch kubectl get pods,services`{{execute}}  )  

`kubectl -n kube-system logs kube-apiserver-controlplane`{{execute}}

> Хотите смотреть логи в реальном времени? 
> Добавьте **-f** к команде для непрерывного потока **continous stream**.

`kubectl -n kube-system logs kube-apiserver-controlplane -f`{{execute}}

или (смотрите вывод `watch kubectl get pods,services`{{execute}}  )  

`kubectl -n kube-system logs kube-apiserver-master -f`{{execute}}

> Нажмите `ctrl + c`, чтобы остановить.  `ctrl + c`{{execute}}

Попробуйте это с другими **pods**.
