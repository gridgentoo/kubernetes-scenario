Первый шаг - установить [Github](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin) и [Pipeline](https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin) плагины, так как мы будем использовать **Pipeline** для клонирования и создания репозитория **Github**.

#### Задача: Install Plugins

1. На **Dashboard**, слева выберите **Manage Jenkins**.
2. На странице **Configuration page** выберите **Manage Plugins**..
3. На странице **Manage Plugins** появится интерфейс с вкладками. Нажмите **Available** и подождите три секунды, чтобы просмотреть все плагины **Jenkins**, которые можно установить.
4. Используя поле поиска, найдите **Github plugin** и установите этот плагин с помощью флажка.
5. На этой странице найдите **Pipeline** и выберите плагин с помощью флажка.
6. Нажмите **Install without Restart** внизу.
7. Плагины будут загружены и установлены. После завершения нажмите ссылку **Go back to the top page**.

Теперь ваш сервер **Jenkins** можно настроить для создания приложения **'hello world'** с использованием **pipelines**.
