На предыдущем этапе мы сделали **pulled**, **Jenkins image** из **Docker Hub**.
Теперь пришло время запустить **container** на основе этого **image**.

Для этого введите следующую **command**:

`docker run -d -u root -p 80:8080 jenkins`{{execute}}

### Here,

**-d** : Detached Mode. Запустить контейнер в **background** режиме и **print container ID**

**-u** : User. **Username** или **UID**. **'root'**  в этом случае

**-p** : Publish. Опубликуйте **container’s port(s)** контейнера на хосте

**jenkins** : Имя **base image** для запуска этого контейнера


После выполнения этой команды будет создан **new container**, и его **Container ID** будет напечатан в **terminal**.

