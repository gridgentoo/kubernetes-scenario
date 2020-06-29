**Pods** часто реплицируются для обработки параллельных запросов. 
**Service** позаботится о балансировке нагрузки **round robin**, **load balancing** между доступными **Pods**.

Мы будем масштабировать **hello Pod** вверх и вниз. 
Сначала в другом терминале **terminal** запускают непрерывный цикл, который создаёт некоторую нагрузку на **service**.

`while true; do curl -s https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/ -w 'Time: %{time_total}' | grep -E 'Hostname|Time' | xargs; done`{{execute T2}}

Со всеми запросами **curl** в цикле **single Pod instance** производит все **responses**. 
Однако в распределенных системах **distributed systems** с глубоким пулом ресурсов **deep pool of resources**, очень часто добавляют больше процессов, которые могут обслуживать несколько запросов **service multiple requests**. Запросити, чтобы **Kubernetes** увеличил _echoservice_ через большее количество Подов.

`kubectl scale deployment hello --replicas=3`{{execute T1}}

Kubernetes раскручивает новые и **duplicated Pods**, и одна и та же служба **service** начинает балансировать запросы между **pods**.

`kubectl get pods -l run=hello`{{execute T1}}

**single service** для этих **3 pods** теперь имеет **IP-адреса** трех подов и балансировку нагрузки между ними.

`kubectl describe service hello | grep "Endpoints"`{{execute}}

Посмотрите на другой терминал **terminal**, и через несколько секунд выходные данные укажут, что балансировщик нагрузки распределяет запросы  **load balancer is rotating the requests** между тремя **nodes**.

Масштабируйте **Pods** до нуля и посмотрите, что происходит с той же командой **top** и запросами в другом терминале.

`kubectl scale deployment hello --replicas=0`{{execute T1}}

В списке будут показаны **pods Terminating**, а затем список будет пустым.

`kubectl get pods`{{execute T1}}

Обратите внимание, что, когда число подов равно нулю, служба **service**, работающая в **Terminal 2**, не сообщает об ответах **responses**. Вскоре вышеприведенная команда сообщит **No resources found** (Не найдены ресурсы).

**Scale** масштабируйте Поды обратно до 1 и посмотрите, как будут восстановлены запросы **requests**.

`kubectl scale deployment hello --replicas=1`{{execute T1}}

Новый Под должен появиться через мгновение.

`kubectl get deployments,pods`{{execute T1}}

Через несколько секунд метрики **metrics** будут доступны для нового Пода.

`kubectl get pods -l run=hello`{{execute T1}}
