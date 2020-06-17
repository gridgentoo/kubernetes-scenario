# Вывод #

Теперь вы понимаете, как запустить базовую конфигурацию **RabbitMQ** в **Kubernetes**. Фактическое **production deployment,** безусловно, может быть более сложным, чтобы поддерживать постоянство и более высокую доступность **higher availability**. Если существующей **Helm chart** недостаточно, рассмотрите возможность внести свой вклад в проект или создать **Helm chart** для своих собственных нужд.

## Lessons Learned ##

С помощью этих шагов вы узнали:

- &#x2714; как использовать основы инструмента **CLI kubectl** и **helm CLI tool**,
- &#x2714; как установить **RabbitMQ** в **Kubernetes**.


Надеюсь, вы также понимаете, что **Kubernetes** - это новый тип центров обработки данных **operating system**, работающий с системой, который может запускать ваши приложения на нескольких узлах на локальном ноутбуке, стойке серверов **rack of servers** или любой облачной инфраструктуре **cloud target**. Если вы планируете депдоить **multiple containers**, рассмотрите **consider layering** в **Helm** в качестве **package manager** для этих манифестов **manifests**.

## References ##

- [RabbitMQ](https://www.rabbitmq.com/)
- [RabbitMQ stable Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq). 
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/yunusov.png" width="100" style="border-radius: 12px">
Для более глубокого понимания этих тем и многого другого присоединяйтесь к <br>[Yunusov Temur](https://gridgentoo.github.io/)<br> на различных конференциях, симпозиумах, семинарах и встречах.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & DevOps Specialist</b>
</p>
