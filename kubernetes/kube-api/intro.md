# Kubernetes API #
![Katacoda Logo](./assets/logo-text-with-head.png)  

![Kubernetes](./assets/kubernetes.png "Kubernetes")

Этот сценарий познакомит вас с основами доступа и изучения **Kubernetes API**. API используется для создания, чтения, обновления и удаления ([CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)) и объекта или ресурса **Kubernetes**.

В этом сценарии вы изучите:

- Доступ к **API** через **kubectl**
- Интроспекция и анализ объектов в кластере через **API**
- Доступ к **API** кластера локально через **Proxy**
- Discover api-resources and api-versions
- Discover the Explain and Describe commands

Сервер Kubernetes API является шлюзом в Kubernetes и доступен через HTTP. Все административные взаимодействия с Kubernetes осуществляются через этот API. Внешние инструменты командной строки, языковые библиотеки, а также внутренние контроллеры internal controllers и operators используют один и тот же API для всех операций CRUD operations в отношении Kubernetes.
