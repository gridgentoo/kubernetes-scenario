Мы подготовим среду с сервером **Jenkins**, работающим как **Docker Container**.

> Примечание: шаги с 1 по 3 можно пропустить, если вы хотите перейти непосредственно к секции **pipeline**. На шаге 4 мы предоставим предварительно настроенный образ **Jenkins**.

Сначала мы запускаем **container** в автономном режиме с **tail**  к **log file** , который мы создадим и будем использовать позже:

`docker run -d -u root --rm --name jenkins \
    -p 8080:8080 -p 50000:50000 \
    --entrypoint bash \
    jenkins:2.46.2-alpine \
    -c "tail -F /jenkins.log"`{{execute}}
    
    
С помощью следующей команды мы клонируем **Jenkins Home directory** в контейнер, прежде чем запускать приложение **Jenkins**. 

**Jenkins Home directory** подготовлен, чтобы мы могли использовать **Jenkins** без входа в систему:

`docker exec -d jenkins \
    bash -c 'git clone https://github.com/oveits/jenkins_home_alpine \
        && export JENKINS_HOME=$(pwd)/jenkins_home_alpine \
        && java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log &'`{{execute}}

Примерно через минуту мы должны увидеть, что **jenkins.war** запущен:

`docker exec jenkins ps -ef`{{execute}}

#### Загрузить Dashboard

Вы можете загрузить **Jenkins' dashboard** по следующему URL-адресу https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ или щелкнув вкладку панели управления справа (обратите внимание: иногда вы нужно подождать несколько секунд и в этот момент нажать **"display port"**).

На следующих шагах вы будете использовать **dashboard**, чтобы настроить плагины и начать создавать **Docker Images**.
