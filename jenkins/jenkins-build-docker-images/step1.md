Инструменты DevOps: Jenkins (электронный курс) 
https://sberbank-school.ru/programs/1661/item/99989

Модуль комплексной специализированной программы "Инструменты DevOps"

Трудоемкость (дистанционная).  8 ак. ч. академических часов.  

О преподавателе и авторе курса, Илья Гаврилюк.  


```git clone https://github.com/gavriluk/jenkins-pipeline-workshop```{{execute}}


```cd jenkins-pipeline-workshop```{{execute}}


```docker-compose up -d```{{execute}}


Сервисы стартуют некоторое время. После запуска сервисов они должны быть доступны по следующим портам:

Portainer порт: 9001 http://localhost:9001/ 

Jenkins порт: 8080 http://localhost:8080/

Nexus порт: 8081 http://localhost:8081/

Sonar порт: 9000 http://localhost:9000/

BitBucket порт: 7990 http://localhost:7990/

docker ps

docker-compose logs jenkins0

admin:admin

user:user

Примерно через минуту мы должны увидеть, что **jenkins.war** запущен:

`docker exec jenkins ps -ef`{{execute}}

#### Загрузить Dashboard

Откройте **Jenkins dashboard** по следующему URL-адресу https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ или щелкнув вкладку панели управления справа (обратите внимание: иногда вы нужно подождать несколько секунд и в этот момент нажать **"display port"**).

На следующих шагах вы будете использовать **dashboard**, чтобы настроить плагины и начать создавать **Docker Images**.

