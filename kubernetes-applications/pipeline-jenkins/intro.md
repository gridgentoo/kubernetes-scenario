В этой лабораторной работе мы научимся запускать конвейер **CI/CD pipeline** с **Jenkins** и **Kubernetes**.

![Jenkins](/sylus/courses/kubernetes-fundamentals-2/module-6/assets/jenkins.png)

> [Jenkins]("https://en.wikipedia.org/wiki/Jenkins_%28software%28")- это сервер **automation server** с открытым исходным кодом, написанный на Java. **Jenkins** помогает автоматизировать **non-human** часть процесса разработки программного обеспечения, обеспечивая непрерывную интеграцию **continuous integration** и облегчая технические аспекты непрерывной доставки **continuous delivery**.

Будут рассмотрены следующие темы **topics**:

- Инсталяция и конфигурирование **Jenkins** из **Helm chart**
- Демонстрация **Kubernetes plugin** для **Jenkins**
- Build, deploy и запустить контейнер из Jenkinsfile 
- Обновление контейнера с canary deployment

> Примечание. Canary release - это метод, позволяющий снизить риск внедрения новой версии программного обеспечения в **production by rolling out** изменений в подмножестве пользователей перед всей инфраструктурой.