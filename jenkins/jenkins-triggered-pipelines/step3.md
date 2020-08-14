После установки подключаемых модулей вы можете настроить, как **pipelines** используют **Git** и **Maven** для загрузки и создания приложения **hello world**.

#### Задача: настроить плагин **Maven**

На этом шаге настраивается плагин **Maven**.

1. Еще раз выберите **Manage Jenkins**.
2. Выберите **Global Tool Configuration**.
3. Внизу есть кнопка **Maven installations...**. Щелкните по нему.
4. Выберите имя **M3**.
5. Установите флажок **Install automatically**  и оставьте вариант **Install from Apache** с версией 3.5.0.
6. Нажмите **Apply** внизу страницы.

#### Задача: сконфигурировать **Git Plugin**
 
На этом шаге сконфигурируем плагин **Git**.

1. На странице **Manage Jenkins** найдите раздел Git -> **Git installations** -> **Git**.
2. Сохраните имя **Default** и установите checkbox **Install automatically** 
3. В раскрывающемся меню **Add Installer** выберите **Run Shell Command**..
4. Скопируйте команду **which git || (apk update && apk upgrade &&  apk add --no-cache git)** в поле команд. Эта команда действительна только для выбранного **alpine image** и должна быть адаптирована для других дистрибутивов Linux.
5. В поле **Tool Home box** введите **/usr/bin/git**.
6. Нажмите **Save** внизу страницы.

Теперь **Jenkins Pipelines** готовы к использованию **Git** и **Maven**.
