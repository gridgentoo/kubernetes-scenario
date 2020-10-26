**Chaos Mesh** - это новый проект с открытым исходным кодом, запущенный в четвертом квартале 2019 года. Он наполнен многими экспериментальными функциями, которые вы ожидаете написать для тестирования **Chaos testing**. Проект находится в активной разработке как [проект песочницы с CNCF](https://www.cncf.io/sandbox-projects/). Этот сценарий Катакоды будет обновляться по мере развития.

В проекте выбран правильный путь нативной архитектуры **native architecture** для использования **Kubernetes Operator Pattern**. Определяя набор CRD, его контроллер принимает от вас **declarations** для экспериментов в форме **YAML manifests**. Ожидается, что эти **YAML** будут **infrastructure as code** и частью вашего **CI/CD pipeline** вместе с другими вашими формулами тестирования.

С помощью этих шагов вы узнали:

- инсталлируйте **Chaos Mesh** на **Kubernetes**
- инсталлируйте и **label applications** маркируйте приложения, чтобы сделать их подходящими целями для хаоса
- Создавайте и проводите эксперименты с хаосом **chaos experiments**
- Наблюдайте за механизмом хаоса **chaos engine**, проводите эксперименты с кластерными объектами.


> В прошлом году мы стали свидетелями того, как **Chaos Engineering** перешла от широко обсуждаемой идеи к общепринятому, массовому подходу к улучшению и обеспечению устойчивости распределенных систем. По мере того, как большие и малые организации начинают внедрять **Chaos Engineering** в качестве операционного процесса, мы учимся безопасно применять эти методы в любом масштабе. Такой подход определенно не для всех, и, чтобы быть эффективным и безопасным, он требует масштабной организационной поддержки. -- [ThoughtWorks Radar](https://www.thoughtworks.com/radar/techniques/chaos-engineering)

## Ссылки ##

- [Chaos Mesh project](https://github.com/chaos-mesh/chaos-mesh)
- [Chaos Mesh documentation](https://chaos-mesh.org/docs/)
- [K8s Chaos Dive, Chaos-Mesh Part 1, Craig Morten](https://dev.to/craigmorten/k8s-chaos-dive-2-chaos-mesh-part-1-2i96)
- [Principles of Chaos Engineering](http://principlesofchaos.org/)
- [Fallacies of Distributed Computing Explained (PDF)](http://www.rgoarchitects.com/Files/fallacies.pdf)

------

