## Example Project ##

Клонируем пример проекта **Java**.

`git clone https://github.com/javajon/code-analysis`{{execute}}

Этот проект включает в себя каталог микросервисов, который содержит небольшое приложение **Spring Boot**, созданное с помощью **Gradle**.  
Перейдите в корневой каталог источника приложения.

`cd code-analysis/microservice`{{execute}}

## Analysis ##

Проанализируйте этот проект микросервисов, используя **SonarQube** в качестве механизма **rule engine** и панели мониторинга, где публикуются результаты.

Получите местоположение **SonarQube engine**.

`SONAR_SERVICE=https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

Запустите анализ.

`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}

Анализ в **SonarQube** займет около 1-2 минут. По завершении перейдите на портал **SonarQube** и просмотрите анализируемый проект. Доступ к порталу можно получить на вкладке с пометкой **SonarQube Portal** над этой **command-line** или по этой ссылке:  https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/.

