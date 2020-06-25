Сценарий представил некоторые фундаментальные техник для проверки событий **inspecting events** и логов приложений в **Kubernetes**. Поскольку **Kubernetes is distributed**, вы не можете просто просмотреть логи, найденные в одном директории.

 Помимо этого сценария, изучите методы автоматизации агрегации и синхронизации логов. Логи хранятся в каталогах **/var/log/container** и **/var/log/pods**, которые считаются эфемерными **ephemeral**. DaemonSets на **Nodes** и **Sidecars** в **Pods** могут централизовать и синхронизировать эти логи с другими службами. Другие сервисы, такие как **Elasticsearch**, предлагают надежное **long-term persistence**, расширенные запросы  **rich queries** и автоматическое оповещение **automatic alerting** на основе правил, часто определяемых инженерами по надежности сайтов **Site Reliability Engineers (SREs)**. В качестве следующего шага изучите сценарий **Logging with EFK**..

## Lessons Learned ##

С помощью этих шагов вы узнали, как:

- &#x2714; ensure your 12-factor application generates logs to streams,
- &#x2714; inspect Kubernetes cluster events,
- &#x2714; inspect container logs across multiple Pods,
- &#x2714; use some convenient command-line tools to view log aggregations.

## References ##

- [Logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#interacting-with-running-pods)

------

<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/yunusov.png" width="100" style="border-radius: 12px">
Для более глубокого понимания этих тем и многого другого присоединяйтесь к <br>[Yunusov Temur](https://gridgentoo.github.io/)<br> на различных конференциях, симпозиумах, семинарах и встречах.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & DevOps Specialist</b>
</p>