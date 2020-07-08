# Вывод #

Теперь вы в основном понимаете, как **Jenkins** может работать в **Kubernetes**. **Jenkins** управляет **pipelines**, в то время как он использует Kubernetes для **schedule** планирования агентов и поддержания работы **engine running**. Надеюсь, вы также понимаете, что **Kubernetes** - это новый тип **data center _operating system_** , работающих с системой, который может запускать ваши приложения - на нескольких узлах вашего локального ноутбука, в стойке серверов или любой облачной **cloud target**.

## Технологический стек ##

Эта демонстрация была выполнена с этими **tools**.

- Kubernetes
- Kubectl
- Helm
- Prometheus Operator
- Kube-Prometheus (Alertmanager + Grafana)
- Python
- Смотрите файл **jenkins-value.yaml** для версии **Jenkins** и его **plugins**

## References ##

- [Jenkins](https://jenkins.io/)
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)
- [Canary deployments](
https://whatis.techtarget.com/definition/canary-canary-testing)
- [Jenkins stable Helm chart](https://github.com/kubernetes/charts/tree/master/stable/jenkins)
- [Kubernetes plugin for Jenkins](https://github.com/jenkinsci/kubernetes-plugin)
- [Jenkins agent with Docker and Kubectl](https://github.com/radu-matei/jenkins-slave-docker)

## Acknowledgments ##

-  Особая благодарность за вдохновение для этого урока от [Chris Ricci](https://github.com/cricci82) из CoreOS (теперь RedHat)..
- Эта демонстрация основана на Chris Ricci и Duffie Cooley, []*Непрерывное развертывание и мониторинг с презентацией Tectonic, Prometheus и Jenkins*](https://www.brighttalk.com/webcast/14601/267207/continuous-deployment-and-monitoring-with-tectonic-prometheus-and-jenkins) презентация находится здесь BrightTALK. Начинается с тайминга 24:15.

## Etcetera ##

- - Учебное видео: демонстрация: [Lachlan Evenson's](https://github.com/lachie83/croc-hunter) демонстрация [Kubernetes CI/CD за 5 минут с Jenkins and Helm](https://youtu.be/eMOzF_xAm7w)
- Учебное видео: [Continuously delivering apps в Кубернетес с помощью Helm - Adnan Abdulhussein (Bitnami)](https://youtu.be/CmPK93hg5w8)
- [Jenkins Slave with Docker client and kubectl CLI](https://github.com/radu-matei/jenkins-slave-docker)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/yunusov.png" width="100" style="border-radius: 12px">
Для более глубокого понимания этих тем и многого другого присоединяйтесь к <br>[Yunusov Temur](https://gridgentoo.github.io/)<br> на различных конференциях, симпозиумах, семинарах и встречах.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & DevOps Specialist</b>
</p>

